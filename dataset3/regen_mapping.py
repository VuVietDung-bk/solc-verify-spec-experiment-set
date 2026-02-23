#!/usr/bin/env python3
"""Regenerate contract_spec_mapping.txt after splitting."""
import re, os, glob
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
        m = re.match(r'\s*(?:abstract\s+)?contract\s+(\w+)', line)
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

def get_contracts_from_sol(sol_path):
    """Get list of contract names from a sol file."""
    with open(sol_path) as f:
        content = f.read()
    return re.findall(r'^\s*contract\s+(\w+)', content, re.MULTILINE)

all_mapping = []

for cat in categories:
    cat_path = os.path.join(BASE, cat)
    spec_dir = os.path.join(cat_path, 'specification')
    if not os.path.exists(spec_dir):
        continue
    
    # Parse all sol files
    sol_data = {}
    sol_contracts = {}
    for sol in sorted(glob.glob(os.path.join(cat_path, 'buggy_*.sol'))):
        basename = os.path.basename(sol).replace('.sol', '')
        func_map, var_map = parse_contracts_from_sol(sol)
        sol_data[basename] = {'func_to_contract': func_map, 'var_to_contract': var_map}
        sol_contracts[basename] = get_contracts_from_sol(sol)
    
    for spec_path in sorted(glob.glob(os.path.join(spec_dir, '*.spec'))):
        spec_name = os.path.basename(spec_path)
        spec_basename = spec_name.replace('.spec', '')
        
        # Find matching sol file
        sol_name = None
        for sn in sorted(sol_data.keys()):
            if spec_basename == sn or spec_basename.startswith(sn + '_'):
                sol_name = sn
                break
        
        if not sol_name or sol_name not in sol_data:
            continue
        
        func_map = sol_data[sol_name]['func_to_contract']
        var_map = sol_data[sol_name]['var_to_contract']
        
        with open(spec_path) as f:
            content = f.read()
        
        # Find all function calls and variable refs
        funcs = find_func_calls_in_text(content)
        vrs = find_vars_in_text(content)
        
        contracts_used = set()
        for f in funcs:
            if f in func_map:
                contracts_used.add(func_map[f])
        for v in vrs:
            if v in var_map:
                contracts_used.add(var_map[v])
        
        if len(contracts_used) == 1:
            contract = contracts_used.pop()
        elif len(contracts_used) == 0:
            # If no functions matched, try to infer from the sol file
            # If only one contract, use it
            contracts_in_sol = sol_contracts.get(sol_name, [])
            if len(contracts_in_sol) == 1:
                contract = contracts_in_sol[0]
            else:
                contract = contracts_in_sol[-1] if contracts_in_sol else 'unknown'
        else:
            contract = sorted(contracts_used)[0]
        
        all_mapping.append((cat, spec_name, contract))

# Write mapping
mapping_path = os.path.join(BASE, 'contract_spec_mapping.txt')
with open(mapping_path, 'w') as f:
    f.write('# Contract-Spec Mapping\n')
    f.write('# Format: spec_file ~ ContractName\n')
    f.write('#\n')
    current_cat = None
    for cat, spec_name, contract in sorted(all_mapping):
        if cat != current_cat:
            f.write(f'\n## {cat}\n')
            current_cat = cat
        f.write(f'{spec_name} ~ {contract}\n')

print(f'Written {len(all_mapping)} entries to {mapping_path}')
