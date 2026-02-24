// CVL Spec for Map contract - Access Control vulnerability
// The set function can overwrite arbitrary storage including owner

methods {
    function set(uint256, uint256) external;
    function get(uint256) external returns (uint256) envfree;
    function withdraw() external;
    function owner() external returns (address) envfree;
}

/**
 * Rule: owner_unchanged_by_set
 * The set function should not change the owner variable.
 * This will likely fail due to the storage collision vulnerability.
 */
rule owner_unchanged_by_set(env e, uint256 key, uint256 value) {
    address ownerBefore = owner();
    
    set(e, key, value);
    
    address ownerAfter = owner();
    
    assert ownerAfter == ownerBefore;
}

/**
 * Rule: only_owner_can_withdraw
 * Only owner should be able to withdraw funds.
 */
rule only_owner_can_withdraw(env e) {
    require e.msg.sender != owner();
    
    withdraw@withrevert(e);
    
    // Non-owner call should revert
    assert lastReverted;
}
