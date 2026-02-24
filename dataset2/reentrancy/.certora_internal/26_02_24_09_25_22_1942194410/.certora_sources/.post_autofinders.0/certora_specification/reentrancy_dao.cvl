// CVL Spec for ReentrancyDAO - Reentrancy vulnerability
// Credit set to 0 AFTER external call

methods {
    function deposit() external;
    function withdrawAll() external;
    function credit(address) external returns (uint) envfree;
    function balance() external returns (uint) envfree;
}

/**
 * Rule: withdrawAll_sets_credit_zero
 * After withdrawAll, user credit must be 0.
 */
rule withdrawAll_sets_credit_zero(env e) {
    withdrawAll(e);
    
    assert credit(e.msg.sender) == 0;
}

/**
 * Rule: deposit_increases_credit
 * Deposit must increase user credit by msg.value.
 */
rule deposit_increases_credit(env e) {
    uint creditBefore = credit(e.msg.sender);
    
    deposit(e);
    
    assert credit(e.msg.sender) == creditBefore + e.msg.value;
}

/**
 * Rule: deposit_increases_balance
 * Deposit must increase total balance by msg.value.
 */
rule deposit_increases_balance(env e) {
    uint balanceBefore = balance();
    
    deposit(e);
    
    assert balance() == balanceBefore + e.msg.value;
}
