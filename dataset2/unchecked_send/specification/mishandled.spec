// Spec for SendBack (mishandled.sol) - Unchecked send vulnerability
// send() return value not checked

variables {
    mapping(address => uint) userBalances;
}

/**
 * Rule: withdrawBalance_sets_balance_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_balance_zero() {
    withdrawBalance();
    
    assert userBalances[msg.sender] == 0;
}
