#!/usr/bin/env python3
"""Analyze spec files and determine which contract each spec's functions belong to."""
import re, os, glob, json

BASE = os.path.dirname(os.path.abspath(__file__))
categories = ['Overflow-Underflow', 'Re-entrancy', 'Timestamp-Dependency', 'Unchecked-Send', 'Unhandled-Exceptions']

def parse_contracts_from_sol(sol_path):
    """Parse a .sol file and return {contract_name: {func_names}, ...} and {func_name: contract_name}"""
    with open(sol_path) as f:
        content = f.read()
    
    contracts = {}  # contract_name -> set of functions
    func_to_contract = {}  # func_name -> contract_name
    var_to_contract = {}  # variable_name -> contract_name
    
    current_contract = None
    
    for line in content.split('\n'):
        # Match contract declaration
        m = re.match(r'\s*contract\s+(\w+)', line)
        if m:
            current_contract = m.group(1)
            contracts[current_contract] = set()
        
        if current_contract:
            # Match function declarations
            m = re.match(r'\s*function\s+(\w+)\s*\(', line)
            if m:
                fname = m.group(1)
                contracts[current_contract].add(fname)
                func_to_contract[fname] = current_contract
            
            # Match state variable mappings
            m = re.match(r'\s*mapping\s*\(.+\)\s*(?:public\s+)?(\w+)', line)
            if m:
                vname = m.group(1)
                var_to_contract[vname] = current_contract
            
            # Match state variables (uint, address, bool, etc.)
            m = re.match(r'\s*(uint\d*|int\d*|address|bool|string|bytes\d*)\s+(?:public\s+)?(\w+)', line)
            if m:
                vname = m.group(2)
                var_to_contract[vname] = current_contract

    return contracts, func_to_contract, var_to_contract

def parse_spec_functions(spec_path):
    """Parse a .spec file and return list of function calls found in rules."""
    with open(spec_path) as f:
        content = f.read()
    
    functions = set()
    variables = set()
    
    # Find function calls in rules (function_name(args))
    # Look for lines that call functions (not declarations)
    for line in content.split('\n'):
        # Skip rule declarations, variable declarations, require, assert lines with no function calls
        line = line.strip()
        if line.startswith('//') or line.startswith('rule ') or line.startswith('variables') or line == '{' or line == '}':
            continue
        
        # Find function calls - pattern: word followed by (
        # But not keywords like require, assert, etc.
        keywords = {'require', 'assert', 'assert_revert', 'if', 'else', 'uint', 'int', 'address', 'bool', 'mapping', 'returns', 'return'}
        matches = re.findall(r'\b(\w+)\s*\(', line)
        for m in matches:
            if m not in keywords and not m.startswith('_'):
                functions.add(m)
        
        # Find variable references (for mapping to contracts via state vars)
        matches = re.findall(r'\b(\w+)\[', line)
        for m in matches:
            variables.add(m)
    
    return functions, variables, content

def parse_cvl_rules(cvl_path):
    """Parse a .cvl file and return dict of rule_name -> rule_content, and functions used per rule."""
    with open(cvl_path) as f:
        content = f.read()
    
    rules = {}
    rule_functions = {}
    
    # Split into rules
    rule_pattern = re.compile(r'(rule\s+(\w+)\s*\([^)]*\)\s*\{)', re.DOTALL)
    
    # Find all rule starts
    rule_starts = [(m.start(), m.group(2)) for m in rule_pattern.finditer(content)]
    
    for i, (start, name) in enumerate(rule_starts):
        # Find matching closing brace
        brace_count = 0
        pos = start
        rule_start = start
        found_open = False
        while pos < len(content):
            if content[pos] == '{':
                brace_count += 1
                found_open = True
            elif content[pos] == '}':
                brace_count -= 1
                if found_open and brace_count == 0:
                    rules[name] = content[rule_start:pos+1]
                    break
            pos += 1
        
        # Find function calls in this rule
        rule_text = rules.get(name, '')
        keywords = {'require', 'assert', 'env', 'uint', 'int', 'address', 'bool', 'mapping', 'returns', 'return', 'rule'}
        funcs = set()
        for line in rule_text.split('\n'):
            line = line.strip()
            if line.startswith('//') or line.startswith('rule '):
                continue
            matches = re.findall(r'\b(\w+)\s*[@(]', line)
            for m in matches:
                if m not in keywords and not m.startswith('_'):
                    funcs.add(m)
        rule_functions[name] = funcs
    
    return rules, rule_functions, content

results = {}

for cat in categories:
    cat_path = os.path.join(BASE, cat)
    spec_dir = os.path.join(cat_path, 'specification')
    cvl_dir = os.path.join(cat_path, 'certora_specification')
    
    if not os.path.exists(spec_dir):
        continue
    
    print(f'\n{"="*60}')
    print(f'Category: {cat}')
    print(f'{"="*60}')
    
    # Parse all sol files
    sol_data = {}
    for sol in sorted(glob.glob(os.path.join(cat_path, 'buggy_*.sol'))):
        basename = os.path.basename(sol).replace('.sol', '')
        contracts, func_map, var_map = parse_contracts_from_sol(sol)
        sol_data[basename] = {
            'contracts': contracts,
            'func_to_contract': func_map,
            'var_to_contract': var_map
        }
    
    # Parse all spec files
    for spec in sorted(glob.glob(os.path.join(spec_dir, '*.spec'))):
        spec_basename = os.path.basename(spec).replace('.spec', '')
        
        # Find matching sol file
        # For specs like buggy_5_locktime, the sol file is buggy_5
        sol_name = None
        for sn in sol_data:
            if spec_basename == sn or spec_basename.startswith(sn + '_'):
                sol_name = sn
                break
        
        if not sol_name:
            print(f'\n  WARNING: No sol file found for {spec_basename}.spec')
            continue
        
        functions, variables, content = parse_spec_functions(spec)
        func_map = sol_data[sol_name]['func_to_contract']
        var_map = sol_data[sol_name]['var_to_contract']
        
        # Map each function to its contract
        contracts_used = {}
        for func in functions:
            if func in func_map:
                contract = func_map[func]
                if contract not in contracts_used:
                    contracts_used[contract] = []
                contracts_used[contract].append(func)
        
        # Also check variables
        for var in variables:
            if var in var_map:
                contract = var_map[var]
                if contract not in contracts_used:
                    contracts_used[contract] = []
                if var not in contracts_used[contract]:
                    contracts_used[contract].append(f'(var){var}')
        
        is_already_split = spec_basename != sol_name
        needs_split = len(contracts_used) > 1 and not is_already_split
        
        print(f'\n  {spec_basename}.spec -> sol: {sol_name}.sol')
        print(f'    Functions called: {functions}')
        print(f'    Variables used: {variables}')
        print(f'    Contracts used: {contracts_used}')
        print(f'    Already split: {is_already_split}')
        print(f'    NEEDS SPLIT: {needs_split}')
        
        if needs_split:
            key = f'{cat}/{spec_basename}'
            results[key] = {
                'sol_name': sol_name,
                'contracts_used': {k: v for k, v in contracts_used.items()},
                'spec_path': spec,
                'cvl_path': os.path.join(cvl_dir, spec_basename + '.cvl') if os.path.exists(os.path.join(cvl_dir, spec_basename + '.cvl')) else None
            }

print(f'\n\n{"="*60}')
print(f'SUMMARY: Specs that need splitting')
print(f'{"="*60}')
for key, data in sorted(results.items()):
    print(f'\n  {key}.spec:')
    print(f'    Sol file: {data["sol_name"]}.sol')
    print(f'    Contracts: {list(data["contracts_used"].keys())}')
    print(f'    CVL file exists: {data["cvl_path"] is not None}')
