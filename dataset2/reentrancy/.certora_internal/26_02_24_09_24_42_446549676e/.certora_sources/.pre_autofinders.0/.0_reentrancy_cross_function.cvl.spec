// CVL Spec for Reentrancy_cross_function - Reentrancy vulnerability
// Balance set to 0 AFTER external call

methods {
    function withdrawBalance() external;
    function transfer(address, uint) external;
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

/**
 * Rule: transfer_conserves_total
 * Transfer moves balance from sender to recipient.
 */
rule transfer_moves_balance(env e, address to, uint amount) {
    uint senderBefore = userBalances(e.msg.sender);
    uint recipientBefore = userBalances(to);
    
    require e.msg.sender != to;
    require senderBefore >= amount;
    
    transfer(e, to, amount);
    
    assert userBalances(e.msg.sender) == senderBefore - amount;
    assert userBalances(to) == recipientBefore + amount;
}
