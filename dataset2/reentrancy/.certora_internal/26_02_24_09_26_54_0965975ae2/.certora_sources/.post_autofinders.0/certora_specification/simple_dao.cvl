// CVL Spec for SimpleDAO - Reentrancy vulnerability
// Updates credit AFTER external call

methods {
    function donate(address) external;
    function withdraw(uint) external;
    function credit(address) external returns (uint) envfree;
}

/**
 * Rule: withdraw_decreases_credit
 * After withdrawal, credit must decrease by withdrawn amount.
 */
rule withdraw_decreases_credit(env e, uint amount) {
    uint creditBefore = credit(e.msg.sender);
    
    require creditBefore >= amount;
    
    withdraw(e, amount);
    
    assert credit(e.msg.sender) == creditBefore - amount;
}

/**
 * Rule: donate_increases_recipient_credit
 * Donation must increase recipient's credit.
 */
rule donate_increases_credit(env e, address to) {
    uint creditBefore = credit(to);
    
    donate(e, to);
    
    assert credit(to) == creditBefore + e.msg.value;
}
