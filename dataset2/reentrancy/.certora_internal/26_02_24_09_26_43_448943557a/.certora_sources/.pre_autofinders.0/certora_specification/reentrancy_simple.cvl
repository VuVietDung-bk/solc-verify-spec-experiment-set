// CVL Spec for Reentrance (reentrancy_simple) - Reentrancy vulnerability
// Updates balance to 0 AFTER external call
// Note: userBalance mapping is internal, but getBalance() is available

methods {
    function addToBalance() external;
    function withdrawBalance() external;
    function getBalance(address) external returns (uint) envfree;
}

/**
 * Rule: withdrawBalance_sets_balance_to_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_zero(env e) {
    uint balanceBefore = getBalance(e.msg.sender);
    
    withdrawBalance(e);
    
    assert getBalance(e.msg.sender) == 0;
}

/**
 * Rule: addToBalance_increases_balance
 * Adding to balance must increase by msg.value.
 */
rule addToBalance_increases(env e) {
    uint balanceBefore = getBalance(e.msg.sender);
    
    addToBalance(e);
    
    assert getBalance(e.msg.sender) == balanceBefore + e.msg.value;
}
