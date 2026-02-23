// Spec for Reentrance - Reentrancy vulnerability
// Updates balance AFTER external call

variables {
    mapping(address => uint) balances;
}

/**
 * Rule: withdraw_decreases_balance
 * After withdrawal, balance must decrease by withdrawn amount.
 */
rule withdraw_decreases_balance(uint _amount) {
    uint balanceBefore = balances[msg.sender];
    
    require balanceBefore >= _amount;
    
    withdraw(_amount);
    
    assert balances[msg.sender] == balanceBefore - _amount;
}

/**
 * Rule: donate_increases_recipient_balance
 * Donation must increase recipient's balance.
 */
rule donate_increases_balance(address _to) {
    uint balanceBefore = balances[_to];
    
    donate(_to);
    
    assert balances[_to] == balanceBefore + msg.value;
}
