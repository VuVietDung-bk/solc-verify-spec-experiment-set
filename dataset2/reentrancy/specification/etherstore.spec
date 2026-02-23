// Spec for EtherStore - Reentrancy vulnerability
// The contract updates balance AFTER external call, allowing reentrancy

variables {
    mapping(address => uint256) balances;
    mapping(address => uint256) lastWithdrawTime;
    uint256 withdrawalLimit;
}

/**
 * Rule: withdraw_decreases_balance
 * After a successful withdrawal, the user's balance must decrease by the withdrawn amount.
 * In a vulnerable contract, this may not hold if reentrancy allows multiple withdrawals.
 */
rule withdraw_decreases_balance(uint256 _weiToWithdraw) {
    uint256 balanceBefore = balances[msg.sender];
    
    require balanceBefore >= _weiToWithdraw;
    require _weiToWithdraw <= withdrawalLimit;
    
    withdrawFunds(_weiToWithdraw);
    
    uint256 balanceAfter = balances[msg.sender];
    
    assert balanceAfter == balanceBefore - _weiToWithdraw;
}

/**
 * Rule: deposit_increases_balance
 * Depositing funds must increase the user's balance proportionally.
 */
rule deposit_increases_balance() {
    uint256 balanceBefore = balances[msg.sender];
    
    depositFunds();
    
    uint256 balanceAfter = balances[msg.sender];
    
    assert balanceAfter == balanceBefore + msg.value;
}

/**
 * Rule: lastWithdrawTime_only_updated_on_withdraw
 * Last withdraw time should only change when withdraw is called.
 */
rule deposit_no_lastWithdrawTime_change() {
    uint256 timeBefore = lastWithdrawTime[msg.sender];
    
    depositFunds();
    
    assert lastWithdrawTime[msg.sender] == timeBefore;
}
