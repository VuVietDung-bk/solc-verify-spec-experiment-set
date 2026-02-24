// CVL Spec for EtherStore - Reentrancy vulnerability
// The contract updates balance AFTER external call, allowing reentrancy

methods {
    function depositFunds() external;
    function withdrawFunds(uint256) external;
    function balances(address) external returns (uint256) envfree;
    function lastWithdrawTime(address) external returns (uint256) envfree;
    function withdrawalLimit() external returns (uint256) envfree;
}

/**
 * Rule: withdraw_decreases_balance
 * After a successful withdrawal, the user's balance must decrease by the withdrawn amount.
 * In a vulnerable contract, this may not hold if reentrancy allows multiple withdrawals.
 */
rule withdraw_decreases_balance(env e, uint256 _weiToWithdraw) {
    uint256 balanceBefore = balances(e.msg.sender);
    uint256 limit = withdrawalLimit();
    
    require balanceBefore >= _weiToWithdraw;
    require _weiToWithdraw <= limit;
    
    withdrawFunds(e, _weiToWithdraw);
    
    uint256 balanceAfter = balances(e.msg.sender);
    
    assert balanceAfter == balanceBefore - _weiToWithdraw;
}

/**
 * Rule: deposit_increases_balance
 * Depositing funds must increase the user's balance proportionally.
 */
rule deposit_increases_balance(env e) {
    uint256 balanceBefore = balances(e.msg.sender);
    
    depositFunds(e);
    
    uint256 balanceAfter = balances(e.msg.sender);
    
    assert balanceAfter == balanceBefore + e.msg.value;
}

/**
 * Rule: lastWithdrawTime_only_updated_on_withdraw
 * Last withdraw time should only change when withdraw is called.
 */
rule deposit_no_lastWithdrawTime_change(env e) {
    uint256 timeBefore = lastWithdrawTime(e.msg.sender);
    
    depositFunds(e);
    
    assert lastWithdrawTime(e.msg.sender) == timeBefore;
}
