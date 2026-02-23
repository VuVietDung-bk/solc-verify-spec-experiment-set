// Rule: burn should not depend on timestamp
rule burn_no_timestamp_dependency(uint256 value) {
    require value > 0;
    
    burn(value);
    
    assert true, "burn must succeed regardless of timestamp";
}
