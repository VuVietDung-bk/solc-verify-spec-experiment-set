// CVL Spec for Reentrance - Reentrancy vulnerability
// Updates balance AFTER external call

methods {
    function donate(address) external;
    function withdraw(uint) external;
    function balances(address) external returns (uint) envfree;
}

/**
 * Rule: withdraw_decreases_balance
 * After withdrawal, balance must decrease by withdrawn amount.
 */
rule withdraw_decreases_balance(env e, uint _amount) {
    uint balanceBefore = balances(e.msg.sender);
    
    require balanceBefore >= _amount;
    
    withdraw(e, _amount);
    
    assert balances(e.msg.sender) == balanceBefore - _amount;
}

/**
 * Rule: donate_increases_recipient_balance
 * Donation must increase recipient's balance.
 */
rule donate_increases_balance(env e, address _to) {
    uint balanceBefore = balances(_to);
    
    donate(e, _to);
    
    assert balances(_to) == balanceBefore + e.msg.value;
}
