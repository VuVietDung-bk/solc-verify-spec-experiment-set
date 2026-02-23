// Spec for SimpleDAO - Reentrancy vulnerability
// Updates credit AFTER external call

variables {
    mapping(address => uint) credit;
}

/**
 * Rule: withdraw_decreases_credit
 * After withdrawal, credit must decrease by withdrawn amount.
 */
rule withdraw_decreases_credit(uint amount) {
    uint creditBefore = credit[msg.sender];
    
    require creditBefore >= amount;
    
    withdraw(amount);
    
    assert credit[msg.sender] == creditBefore - amount;
}

/**
 * Rule: donate_increases_recipient_credit
 * Donation must increase recipient's credit.
 */
rule donate_increases_credit(address to) {
    uint creditBefore = credit[to];
    
    donate(to);
    
    assert credit[to] == creditBefore + msg.value;
}
