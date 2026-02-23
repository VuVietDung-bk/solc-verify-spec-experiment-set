#!/usr/bin/env python3
"""
Split spec and CVL files so that each file only references functions from a single contract.
Also generate contract_spec_mapping.txt.
"""
import re, os, glob, sys
from collections import defaultdict

BASE = os.path.dirname(os.path.abspath(__file__))
categories = ['Overflow-Underflow', 'Re-entrancy', 'Timestamp-Dependency', 'Unchecked-Send', 'Unhandled-Exceptions']

def parse_contracts_from_sol(sol_path):
    with open(sol_path) as f:
        content = f.read()
    func_to_contract = {}
    var_to_contract = {}
    current_contract = None
    for line in content.split('\n'):
        m = re.match(r'\s*contract\s+(\w+)', line)
        if m:
            current_contract = m.group(1)
        if current_contract:
            m = re.match(r'\s*function\s+(\w+)\s*\(', line)
            if m:
                func_to_contract[m.group(1)] = current_contract
            m = re.match(r'\s*mapping\s*\(.+?\)\s*(?:public\s+|private\s+|internal\s+)?(\w+)', line)
            if m:
                var_to_contract[m.group(1)] = current_contract
            m = re.match(r'\s*(uint\d*|int\d*|address|bool|string|bytes\d*)\s+(?:public\s+|private\s+|internal\s+)?(\w+)', line)
            if m:
                var_to_contract[m.group(2)] = current_contract
    return func_to_contract, var_to_contract

def find_func_calls_in_text(text):
    keywords = {'require', 'assert', 'assert_revert', 'if', 'else', 'uint', 'int',
                'address', 'bool', 'mapping', 'returns', 'return', 'rule', 'env',
                'true', 'false', 'lastReverted', 'currentContract'}
    funcs = set()
    for line in text.split('\n'):
        line = line.strip()
        if line.startswith('//'):
            continue
        matches = re.findall(r'\b(\w+)\s*[@(]', line)
        for m in matches:
            if m not in keywords:
                funcs.add(m)
    return funcs

def find_vars_in_text(text):
    keywords = {'require', 'assert', 'msg', 'block', 'currentContract', 'e'}
    vrs = set()
    for line in text.split('\n'):
        line = line.strip()
        if line.startswith('//'):
            continue
        matches = re.findall(r'(?:currentContract\.)?(\w+)\s*\[', line)
        matches += re.findall(r'currentContract\.(\w+)', line)
        for m in matches:
            if m not in keywords:
                vrs.add(m)
    return vrs

def split_spec_into_rules(content):
    var_block = ''
    var_match = re.search(r'(variables\s*\{[^}]*\})', content, re.DOTALL)
    if var_match:
        var_block = var_match.group(1)
    rules = []
    lines = content.split('\n')
    i = 0
    while i < len(lines):
        if re.match(r'\s*rule\s+\w+', lines[i]):
            comment_start = i
            j = i - 1
            while j >= 0:
                stripped = lines[j].strip()
                if stripped.startswith('//') or stripped == '':
                    comment_start = j
                    j -= 1
                else:
                    break
            while comment_start < i and lines[comment_start].strip() == '':
                comment_start += 1
            brace_count = 0
            rule_end = i
            found_open = False
            for k in range(i, len(lines)):
                brace_count += lines[k].count('{') - lines[k].count('}')
                if '{' in lines[k]:
                    found_open = True
                if found_open and brace_count <= 0:
                    rule_end = k
                    break
            rule_name_match = re.match(r'\s*rule\s+(\w+)', lines[i])
            rule_name = rule_name_match.group(1) if rule_name_match else 'unknown'
            rule_text = '\n'.join(lines[comment_start:rule_end+1])
            rules.append((rule_name, rule_text))
            i = rule_end + 1
        else:
            i += 1
    return var_block, rules

def split_cvl_into_rules(content):
    rules = []
    lines = content.split('\n')
    header_lines = []
    i = 0
    while i < len(lines):
        stripped = lines[i].strip()
        if stripped.startswith('//') and not re.search(r'\brule\b', stripped):
            header_lines.append(lines[i])
            i += 1
        elif stripped == '':
            i += 1
            if header_lines:
                break
        else:
            break
    file_header = '\n'.join(header_lines) if header_lines else ''
    i = 0
    while i < len(lines):
        if re.match(r'\s*rule\s+\w+', lines[i]):
            comment_start = i
            j = i - 1
            while j >= 0:
                stripped = lines[j].strip()
                if stripped.startswith('//') or stripped == '':
                    comment_start = j
                    j -= 1
                else:
                    break
            while comment_start < i and lines[comment_start].strip() == '':
                comment_start += 1
            brace_count = 0
            rule_end = i
            found_open = False
            for k in range(i, len(lines)):
                brace_count += lines[k].count('{') - lines[k].count('}')
                if '{' in lines[k]:
                    found_open = True
                if found_open and brace_count <= 0:
                    rule_end = k
                    break
            rule_name_match = re.match(r'\s*rule\s+(\w+)', lines[i])
            rule_name = rule_name_match.group(1) if rule_name_match else 'unknown'
            rule_text = '\n'.join(lines[comment_start:rule_end+1])
            rules.append((rule_name, rule_text))
            i = rule_end + 1
        else:
            i += 1
    return file_header, rules

def determine_contract_for_rule(rule_name, rule_text, func_to_contract, var_to_contract):
    funcs = find_func_calls_in_text(rule_text)
    vrs = find_vars_in_text(rule_text)
    contracts = set()
    for f in funcs:
        if f in func_to_contract:
            contracts.add(func_to_contract[f])
    for v in vrs:
        if v in var_to_contract:
            contracts.add(var_to_contract[v])
    if len(contracts) == 1:
        return contracts.pop()
    elif len(contracts) > 1:
        return sorted(contracts)[0]
    return None

def build_var_block_for_contract(original_var_block, contract_rules_texts, var_to_contract, target_contract, func_to_contract):
    used_vars = set()
    for _, rule_text in contract_rules_texts:
        used_vars |= find_vars_in_text(rule_text)
    lines = original_var_block.split('\n')
    kept_lines = []
    for line in lines:
        stripped = line.strip()
        if stripped in ('variables', '{', '}', '') or stripped.startswith('variables'):
            kept_lines.append(line)
            continue
        m = re.search(r'(\w+)\s*;', stripped)
        if m and m.group(1) in used_vars:
            kept_lines.append(line)
    has_vars = any(';' in l for l in kept_lines)
    if not has_vars:
        return ''
    return '\n'.join(kept_lines)

def make_contract_suffix(contract_name):
    s = re.sub(r'(?<!^)(?=[A-Z])', '_', contract_name).lower()
    return s

# Main
mapping_entries = []

for cat in categories:
    cat_path = os.path.join(BASE, cat)
    spec_dir = os.path.join(cat_path, 'specification')
    cvl_dir = os.path.join(cat_path, 'certora_specification')
    if not os.path.exists(spec_dir):
        continue
    print(f'\n{"="*60}')
    print(f'Processing: {cat}')
    print(f'{"="*60}')
    sol_data = {}
    for sol in sorted(glob.glob(os.path.join(cat_path, 'buggy_*.sol'))):
        basename = os.path.basename(sol).replace('.sol', '')
        func_map, var_map = parse_contracts_from_sol(sol)
        sol_data[basename] = {'func_to_contract': func_map, 'var_to_contract': var_map}
    
    specs_to_remove = []
    cvls_to_remove = []
    
    for spec_path in sorted(glob.glob(os.path.join(spec_dir, '*.spec'))):
        spec_basename = os.path.basename(spec_path).replace('.spec', '')
        sol_name = None
        for sn in sorted(sol_data.keys()):
            if spec_basename == sn or spec_basename.startswith(sn + '_'):
                sol_name = sn
                break
        if not sol_name:
            print(f'  WARNING: No sol file for {spec_basename}.spec')
            continue
        func_to_contract = sol_data[sol_name]['func_to_contract']
        var_to_contract = sol_data[sol_name]['var_to_contract']
        with open(spec_path) as f:
            spec_content = f.read()
        var_block, rules = split_spec_into_rules(spec_content)
        rule_contracts = {}
        for rule_name, rule_text in rules:
            contract = determine_contract_for_rule(rule_name, rule_text, func_to_contract, var_to_contract)
            rule_contracts[rule_name] = contract
        contract_rules = defaultdict(list)
        for rule_name, rule_text in rules:
            contract = rule_contracts[rule_name]
            if contract:
                contract_rules[contract].append((rule_name, rule_text))
            else:
                contract_rules['unknown'].append((rule_name, rule_text))
        is_already_split = spec_basename != sol_name
        if len(contract_rules) <= 1:
            contract = list(contract_rules.keys())[0] if contract_rules else 'unknown'
            print(f'  {spec_basename}.spec -> {contract} (single contract, no split needed)')
            continue
        
        # NEEDS SPLITTING
        print(f'  {spec_basename}.spec -> SPLITTING into {sorted(contract_rules.keys())}')
        cvl_path = os.path.join(cvl_dir, f'{spec_basename}.cvl')
        cvl_exists = os.path.exists(cvl_path)
        cvl_rules = []
        cvl_rule_contracts = {}
        if cvl_exists:
            with open(cvl_path) as f:
                cvl_content = f.read()
            cvl_header, cvl_rules = split_cvl_into_rules(cvl_content)
            for rule_name, rule_text in cvl_rules:
                contract = determine_contract_for_rule(rule_name, rule_text, func_to_contract, var_to_contract)
                cvl_rule_contracts[rule_name] = contract
        
        for contract, crules in sorted(contract_rules.items()):
            if contract == 'unknown':
                continue
            suffix = make_contract_suffix(contract)
            new_spec_name = f'{sol_name}_{suffix}.spec'
            new_spec_path = os.path.join(spec_dir, new_spec_name)
            contract_var_block = build_var_block_for_contract(var_block, crules, var_to_contract, contract, func_to_contract)
            spec_lines = []
            if contract_var_block:
                spec_lines.append(contract_var_block)
                spec_lines.append('')
            for i, (rname, rtext) in enumerate(crules):
                if i > 0:
                    spec_lines.append('')
                spec_lines.append(rtext)
            spec_lines.append('')
            with open(new_spec_path, 'w') as f:
                f.write('\n'.join(spec_lines))
            print(f'    Created: specification/{new_spec_name}')
            
            if cvl_exists:
                new_cvl_name = f'{sol_name}_{suffix}.cvl'
                new_cvl_path = os.path.join(cvl_dir, new_cvl_name)
                contract_cvl_rules = []
                for rule_name, rule_text in cvl_rules:
                    if cvl_rule_contracts.get(rule_name) == contract:
                        contract_cvl_rules.append((rule_name, rule_text))
                if contract_cvl_rules:
                    cvl_lines = []
                    header = f'// {cat} specification for {contract} ({sol_name}.sol)'
                    cvl_lines.append(header)
                    cvl_lines.append('')
                    for i, (rname, rtext) in enumerate(contract_cvl_rules):
                        if i > 0:
                            cvl_lines.append('')
                        cvl_lines.append(rtext)
                    cvl_lines.append('')
                    with open(new_cvl_path, 'w') as f:
                        f.write('\n'.join(cvl_lines))
                    print(f'    Created: certora_specification/{new_cvl_name}')
        
        specs_to_remove.append(spec_path)
        if cvl_exists:
            cvls_to_remove.append(cvl_path)
    
    # Remove original files after processing
    for p in specs_to_remove:
        os.remove(p)
        print(f'    Removed: specification/{os.path.basename(p)}')
    for p in cvls_to_remove:
        os.remove(p)
        print(f'    Removed: certora_specification/{os.path.basename(p)}')

# Build complete mapping by re-scanning
print(f'\n{"="*60}')
print(f'Building contract_spec_mapping.txt')
print(f'{"="*60}')

all_mapping = []
for cat in categories:
    cat_path = os.path.join(BASE, cat)
    spec_dir = os.path.join(cat_path, 'specification')
    if not os.path.exists(spec_dir):
        continue
    for sol in sorted(glob.glob(os.path.join(cat_path, 'buggy_*.sol'))):
        sol_basename = os.path.basename(sol).replace('.sol', '')
        func_map, var_map = parse_contracts_from_sol(sol)
        for spec_path in sorted(glob.glob(os.path.join(spec_dir, f'{sol_basename}*.spec'))):
            spec_name = os.path.basename(spec_path)
            with open(spec_path) as f:
                content = f.read()
            _, rules = split_spec_into_rules(content)
            contracts_used = set()
            for rname, rtext in rules:
                c = determine_contract_for_rule(rname, rtext, func_map, var_map)
                if c:
                    contracts_used.add(c)
            if len(contracts_used) == 1:
                contract = contracts_used.pop()
            elif len(contracts_used) > 1:
                contract = ', '.join(sorted(contracts_used))
            else:
                contract = 'unknown'
            all_mapping.append((cat, spec_name, contract))

mapping_path = os.path.join(BASE, 'contract_spec_mapping.txt')
with open(mapping_path, 'w') as f:
    f.write('# Contract-Spec Mapping\n')
    f.write('# Format: spec_file ~ contract_name\n')
    f.write('#\n')
    current_cat = None
    for cat, spec_name, contract in sorted(all_mapping):
        if cat != current_cat:
            f.write(f'\n## {cat}\n')
            current_cat = cat
        f.write(f'{spec_name} ~ {contract}\n')

print(f'\nMapping file written to: {mapping_path}')
print(f'Total entries: {len(all_mapping)}')
