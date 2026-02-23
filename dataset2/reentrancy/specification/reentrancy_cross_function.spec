// Spec for Reentrancy_cross_function - Reentrancy vulnerability
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

/**
 * Rule: transfer_conserves_total
 * Transfer moves balance from sender to recipient.
 */
rule transfer_moves_balance(address to, uint amount) {
    uint senderBefore = userBalances[msg.sender];
    uint recipientBefore = userBalances[to];
    
    require msg.sender != to;
    require senderBefore >= amount;
    
    transfer(to, amount);
    
    assert userBalances[msg.sender] == senderBefore - amount;
    assert userBalances[to] == recipientBefore + amount;
}
