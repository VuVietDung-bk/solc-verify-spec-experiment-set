#!/bin/bash
#
# count_loc.sh — Compare LOC: Spec vs CVL vs Annotations
#
# For each spec file:
#   Spec LOC  = non-empty, non-comment lines in .spec
#   CVL  LOC  = non-empty, non-comment lines in corresponding .cvl
#   Anno Lines = "/// @notice" lines in .svspec_out/{base}.*.sol (excl. .annotated.sol)
#
# Split specs (multiple .spec files for one base contract) are grouped by base name.
# Output is TAB-separated for easy post-processing.

set -euo pipefail
cd /root/solc-verify-spec/experiments

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

# Count non-empty, non-comment lines (skip blank lines and // comment lines)
count_loc() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo 0
    return
  fi
  grep -v '^\s*$' "$file" | grep -v '^\s*//' | grep -v '^\s*\*' | grep -v '^\s*/\*' | wc -l
}

# Count "/// @notice" annotation lines in .svspec_out for a given base name
count_annotations() {
  local dir="$1" base="$2"
  local total=0
  for f in "${dir}/.svspec_out/${base}."*.sol; do
    [[ -f "$f" ]] || continue
    [[ "$f" == *".annotated.sol" ]] && continue
    local c
    c=$(grep -c '/// @notice' "$f" 2>/dev/null || true)
    total=$((total + c))
  done
  echo "$total"
}

# Determine the "base" name from a spec filename.
# For split specs like buggy_5_locktime.spec, the base is buggy_5
# (matches .svspec_out/buggy_5.*.sol)
# We detect this by checking if .svspec_out/{full_name}.*.sol exists;
# if not, we try progressively shorter prefixes.
resolve_base() {
  local dir="$1" specname="$2"
  # Try exact match first
  local match
  match=$(ls "${dir}/.svspec_out/${specname}."*.sol 2>/dev/null | head -1)
  if [[ -n "$match" ]]; then
    echo "$specname"
    return
  fi
  # Try removing last _suffix progressively
  local try="$specname"
  while [[ "$try" == *_* ]]; do
    try="${try%_*}"
    match=$(ls "${dir}/.svspec_out/${try}."*.sol 2>/dev/null | head -1)
    if [[ -n "$match" ]]; then
      echo "$try"
      return
    fi
  done
  # Fallback: return specname itself (no svspec output exists)
  echo "$specname"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

# Accumulators for grand totals
declare -A ds_specs ds_spec_loc ds_cvl_loc ds_anno

for dataset in dataset1 dataset2 dataset3; do
  ds_specs[$dataset]=0
  ds_spec_loc[$dataset]=0
  ds_cvl_loc[$dataset]=0
  ds_anno[$dataset]=0

  echo "================================================================"
  echo "  $dataset"
  echo "================================================================"

  for bench in "$dataset"/*/; do
    [[ -d "${bench}specification" ]] || continue
    benchname=$(basename "$bench")

    # Skip categories with no spec files (e.g., TOD, tx.origin)
    local_spec_count=$(ls "${bench}specification/"*.spec 2>/dev/null | wc -l)
    [[ "$local_spec_count" -eq 0 ]] && continue

    has_svspec=0
    [[ -d "${bench}.svspec_out" ]] && has_svspec=1

    echo ""
    echo "--- $benchname ---"

    # Collect unique base names and group spec files
    declare -A base_spec_loc base_cvl_loc base_anno base_specs base_is_split
    # Reset
    for key in "${!base_spec_loc[@]}"; do unset "base_spec_loc[$key]"; done
    for key in "${!base_cvl_loc[@]}"; do unset "base_cvl_loc[$key]"; done
    for key in "${!base_anno[@]}"; do unset "base_anno[$key]"; done
    for key in "${!base_specs[@]}"; do unset "base_specs[$key]"; done
    for key in "${!base_is_split[@]}"; do unset "base_is_split[$key]"; done

    # Ordered list of bases (preserve order)
    bases_ordered=()

    for spec in "${bench}specification/"*.spec; do
      [[ -f "$spec" ]] || continue
      specname=$(basename "$spec" .spec)

      # Find corresponding CVL file
      cvl="${bench}certora_specification/${specname}.cvl"

      sloc=$(count_loc "$spec")
      cloc=$(count_loc "$cvl")

      # Resolve base name for annotation counting
      if [[ $has_svspec -eq 1 ]]; then
        base=$(resolve_base "$bench" "$specname")
      else
        base="$specname"
      fi

      is_split=0
      if [[ "$base" != "$specname" ]]; then
        is_split=1
      fi

      # Accumulate into base group
      if [[ -z "${base_spec_loc[$base]+x}" ]]; then
        bases_ordered+=("$base")
        base_spec_loc[$base]=0
        base_cvl_loc[$base]=0
        base_anno[$base]=-1  # sentinel: not yet counted
        base_specs[$base]=""
        base_is_split[$base]=0
      fi

      base_spec_loc[$base]=$(( ${base_spec_loc[$base]} + sloc ))
      base_cvl_loc[$base]=$(( ${base_cvl_loc[$base]} + cloc ))

      if [[ $is_split -eq 1 ]]; then
        base_is_split[$base]=1
      fi

      if [[ -n "${base_specs[$base]}" ]]; then
        base_specs[$base]="${base_specs[$base]}, $specname"
        base_is_split[$base]=1
      else
        base_specs[$base]="$specname"
      fi
    done

    # Count annotations per base (once per base, not per spec)
    for base in "${bases_ordered[@]}"; do
      if [[ $has_svspec -eq 1 ]]; then
        base_anno[$base]=$(count_annotations "$bench" "$base")
      else
        base_anno[$base]=0
      fi
    done

    # Print results
    bench_specs=0
    bench_spec_loc=0
    bench_cvl_loc=0
    bench_anno=0

    for base in "${bases_ordered[@]}"; do
      sloc=${base_spec_loc[$base]}
      cloc=${base_cvl_loc[$base]}
      anno=${base_anno[$base]}
      split_tag=""
      [[ ${base_is_split[$base]} -eq 1 ]] && split_tag=" [SPLIT: ${base_specs[$base]}]"

      # Count number of spec files in this base
      IFS=',' read -ra parts <<< "${base_specs[$base]}"
      nspecs=${#parts[@]}
      bench_specs=$((bench_specs + nspecs))
      bench_spec_loc=$((bench_spec_loc + sloc))
      bench_cvl_loc=$((bench_cvl_loc + cloc))
      bench_anno=$((bench_anno + anno))

      # Ratio
      if [[ $sloc -gt 0 ]]; then
        ratio=$(awk "BEGIN{printf \"%.2f\", $anno/$sloc}")
      else
        ratio="N/A"
      fi

      echo "  $base | spec_loc=$sloc | cvl_loc=$cloc | anno=$anno | ratio=$ratio${split_tag}"
    done

    echo "  >> Subtotal: ${bench_specs} specs | spec_loc=$bench_spec_loc | cvl_loc=$bench_cvl_loc | anno=$bench_anno"

    ds_specs[$dataset]=$(( ${ds_specs[$dataset]} + bench_specs ))
    ds_spec_loc[$dataset]=$(( ${ds_spec_loc[$dataset]} + bench_spec_loc ))
    ds_cvl_loc[$dataset]=$(( ${ds_cvl_loc[$dataset]} + bench_cvl_loc ))
    ds_anno[$dataset]=$(( ${ds_anno[$dataset]} + bench_anno ))
  done

  echo ""
  total_spec=${ds_specs[$dataset]}
  total_sloc=${ds_spec_loc[$dataset]}
  total_cloc=${ds_cvl_loc[$dataset]}
  total_anno=${ds_anno[$dataset]}
  if [[ $total_sloc -gt 0 ]]; then
    total_ratio=$(awk "BEGIN{printf \"%.2f\", $total_anno/$total_sloc}")
  else
    total_ratio="N/A"
  fi
  echo ">>> $dataset TOTAL: $total_spec specs | spec_loc=$total_sloc | cvl_loc=$total_cloc | anno=$total_anno | ratio=$total_ratio"
  echo ""
done

echo "================================================================"
echo "  GRAND TOTALS"
echo "================================================================"
grand_specs=0; grand_sloc=0; grand_cloc=0; grand_anno=0
for dataset in dataset1 dataset2 dataset3; do
  grand_specs=$((grand_specs + ${ds_specs[$dataset]}))
  grand_sloc=$((grand_sloc + ${ds_spec_loc[$dataset]}))
  grand_cloc=$((grand_cloc + ${ds_cvl_loc[$dataset]}))
  grand_anno=$((grand_anno + ${ds_anno[$dataset]}))
  echo "  $dataset: ${ds_specs[$dataset]} specs | spec_loc=${ds_spec_loc[$dataset]} | cvl_loc=${ds_cvl_loc[$dataset]} | anno=${ds_anno[$dataset]}"
done
if [[ $grand_sloc -gt 0 ]]; then
  grand_ratio=$(awk "BEGIN{printf \"%.2f\", $grand_anno/$grand_sloc}")
else
  grand_ratio="N/A"
fi
echo "  ---"
echo "  ALL: $grand_specs specs | spec_loc=$grand_sloc | cvl_loc=$grand_cloc | anno=$grand_anno | ratio=$grand_ratio"
