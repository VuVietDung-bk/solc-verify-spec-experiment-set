// CVL Spec for ReentrancyDAO - Reentrancy vulnerability
// Credit set to 0 AFTER external call
// Note: credit and balance are private state variables

methods {
    function deposit() external;
    function withdrawAll() external;
}

/**
 * Rule: withdrawAll_does_not_revert
 * withdrawAll should not revert.
 */
rule withdrawAll_no_revert(env e) {
    withdrawAll@withrevert(e);
    
    assert !lastReverted;
}

/**
 * Rule: deposit_does_not_revert
 * Deposit should not revert for any msg.value.
 */
rule deposit_no_revert(env e) {
    deposit@withrevert(e);
    
    assert !lastReverted;
}
