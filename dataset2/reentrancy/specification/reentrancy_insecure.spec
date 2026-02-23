// Spec for Reentrancy_insecure - Reentrancy vulnerability
// Balance set to 0 AFTER external call

variables {
    mapping(address => uint) userBalances;
}

/**
 * Rule: withdrawBalance_sets_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_zero() {
    withdrawBalance();
    
    assert userBalances[msg.sender] == 0;
}
