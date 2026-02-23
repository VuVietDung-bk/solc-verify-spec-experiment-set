// Spec for Map contract - Access Control vulnerability
// The set function can overwrite arbitrary storage including owner

variables {
    address owner;
}

/**
 * Rule: owner_unchanged_by_set
 * The set function should not change the owner variable.
 * This will likely fail due to the storage collision vulnerability.
 */
rule owner_unchanged_by_set(uint256 key, uint256 value) {
    address ownerBefore = owner;
    
    set(key, value);
    
    assert owner == ownerBefore;
}

/**
 * Rule: only_owner_can_withdraw
 * Only owner should be able to withdraw funds.
 */
rule only_owner_can_withdraw() {
    require msg.sender != owner;
    
    withdraw();
    
    // If non-owner can call withdraw without revert, this is a bug
    assert false;
}
