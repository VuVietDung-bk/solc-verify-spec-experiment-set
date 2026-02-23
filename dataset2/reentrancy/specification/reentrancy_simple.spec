// Spec for Reentrance (reentrancy_simple) - Reentrancy vulnerability
// Updates balance to 0 AFTER external call

variables {
    mapping(address => uint) userBalance;
}

/**
 * Rule: withdrawBalance_sets_balance_to_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_zero() {
    uint balanceBefore = userBalance[msg.sender];
    
    withdrawBalance();
    
    assert userBalance[msg.sender] == 0;
}

/**
 * Rule: addToBalance_increases_balance
 * Adding to balance must increase by msg.value.
 */
rule addToBalance_increases() {
    uint balanceBefore = userBalance[msg.sender];
    
    addToBalance();
    
    assert userBalance[msg.sender] == balanceBefore + msg.value;
}
