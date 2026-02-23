// CVL Spec for Reentrancy_insecure - Reentrancy vulnerability
// Balance set to 0 AFTER external call

methods {
    function withdrawBalance() external;
    function userBalances(address) external returns (uint) envfree;
}

/**
 * Rule: withdrawBalance_sets_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_zero(env e) {
    withdrawBalance(e);
    
    assert userBalances(e.msg.sender) == 0;
}
