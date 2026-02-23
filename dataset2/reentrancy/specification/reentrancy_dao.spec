// Spec for ReentrancyDAO - Reentrancy vulnerability
// Credit set to 0 AFTER external call

variables {
    mapping(address => uint) credit;
    uint balance;
}

/**
 * Rule: withdrawAll_sets_credit_zero
 * After withdrawAll, user credit must be 0.
 */
rule withdrawAll_sets_credit_zero() {
    withdrawAll();
    
    assert credit[msg.sender] == 0;
}

/**
 * Rule: deposit_increases_credit
 * Deposit must increase user credit by msg.value.
 */
rule deposit_increases_credit() {
    uint creditBefore = credit[msg.sender];
    
    deposit();
    
    assert credit[msg.sender] == creditBefore + msg.value;
}

/**
 * Rule: deposit_increases_balance
 * Deposit must increase total balance by msg.value.
 */
rule deposit_increases_balance() {
    uint balanceBefore = balance;
    
    deposit();
    
    assert balance == balanceBefore + msg.value;
}
