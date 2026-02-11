#!/bin/bash
cd /root/solc-verify-spec/experiments

count_spec_loc() {
  grep -v '^\s*$' "$1" | grep -v '^\s*//' | wc -l
}

count_annotations_in_dir() {
  local dir="$1" pattern="$2"
  local total=0
  for f in $dir/.svspec_out/${pattern}.*.sol; do
    [[ "$f" == *".annotated.sol" ]] && continue
    [[ -f "$f" ]] || continue
    local c=$(grep -c '/// @notice' "$f")
    total=$((total + c))
  done
  echo "$total"
}

is_split_file() {
  local name="$1"
  case "$name" in
    *_transfer|*_locktime|*_ent17|*_ent3|*_ent25|*_ent11|*_ownable|*_stoppable|*_pool|*_ethpool)
      return 0 ;;
    *)
      return 1 ;;
  esac
}

for dataset in dataset1 dataset2 dataset3; do
  echo "================================================================"
  echo "  $dataset"
  echo "================================================================"
  for bench in $dataset/*/; do
    [[ -d "$bench/specification" ]] || continue
    [[ -d "$bench/.svspec_out" ]] || continue
    benchname=$(basename "$bench")
    echo ""
    echo "--- $benchname ---"
    
    # Regular spec files
    for spec in "$bench/specification/"*.spec; do
      [[ -f "$spec" ]] || continue
      name=$(basename "$spec" .spec)
      if is_split_file "$name"; then
        continue
      fi
      
      loc=$(count_spec_loc "$spec")
      anno=$(count_annotations_in_dir "$bench" "$name")
      echo "  $name | spec_loc=$loc | annotations=$anno"
    done
  done
  echo ""
done

echo ""
echo "================================================================"
echo "  SPLIT SPECS (counted from split files)"
echo "================================================================"

# dataset3/Overflow-Underflow split specs
for base in buggy_5 buggy_20 buggy_47; do
  dir="dataset3/Overflow-Underflow"
  total_loc=0
  for sf in "${dir}/specification/${base}_"*.spec; do
    [[ -f "$sf" ]] || continue
    c=$(count_spec_loc "$sf")
    total_loc=$((total_loc + c))
  done
  anno=$(count_annotations_in_dir "$dir" "$base")
  echo "  OF/$base | spec_loc=$total_loc | annotations=$anno [SPLIT]"
done

# dataset3/Re-entrancy split spec
dir="dataset3/Re-entrancy"
total_loc=0
for sf in "${dir}/specification/buggy_20_"*.spec; do
  [[ -f "$sf" ]] || continue
  c=$(count_spec_loc "$sf")
  total_loc=$((total_loc + c))
done
anno=$(count_annotations_in_dir "$dir" "buggy_20")
echo "  RE/buggy_20 | spec_loc=$total_loc | annotations=$anno [SPLIT]"

# dataset3/Timestamp-Dependency split spec
dir="dataset3/Timestamp-Dependency"
total_loc=0
for sf in "${dir}/specification/buggy_20_"*.spec; do
  [[ -f "$sf" ]] || continue
  c=$(count_spec_loc "$sf")
  total_loc=$((total_loc + c))
done
anno=$(count_annotations_in_dir "$dir" "buggy_20")
echo "  TS/buggy_20 | spec_loc=$total_loc | annotations=$anno [SPLIT]"
