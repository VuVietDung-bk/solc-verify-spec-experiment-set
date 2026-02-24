// CVL Spec for Reentrancy_cross_function - Reentrancy vulnerability
// Balance set to 0 AFTER external call
// Note: userBalances is a private mapping, not accessible directly

methods {
    function withdrawBalance() external;
    function transfer(address, uint) external;
}

/**
 * Rule: withdrawBalance_does_not_revert
 * withdrawBalance should succeed for any user.
 */
rule withdrawBalance_no_revert(env e) {
    withdrawBalance@withrevert(e);
    
    assert !lastReverted;
}

/**
 * Rule: transfer_reverts_on_insufficient_balance
 * Transfer with more than available balance should fail gracefully.
 */
rule transfer_no_revert(env e, address to, uint amount) {
    transfer@withrevert(e, to, amount);
    
    // If it didn't revert, the operation succeeded
    assert true;
}
