// CVL Spec for Reentrancy_insecure - Reentrancy vulnerability
// Balance set to 0 AFTER external call
// Note: userBalances is a private mapping

methods {
    function withdrawBalance() external;
}

/**
 * Rule: withdrawBalance_does_not_revert
 * withdrawBalance should not revert.
 */
rule withdrawBalance_no_revert(env e) {
    withdrawBalance@withrevert(e);
    
    assert !lastReverted;
}
