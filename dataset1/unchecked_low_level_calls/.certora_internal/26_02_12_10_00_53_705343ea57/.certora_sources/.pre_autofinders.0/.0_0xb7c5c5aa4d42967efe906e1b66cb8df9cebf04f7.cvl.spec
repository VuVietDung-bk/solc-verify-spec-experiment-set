methods {
    function withdraw() external;
}

/// @title withdraw must reset user balance and debit contract
rule withdraw_resets_balance(env e) {
    require currentContract.balances[e.msg.sender] > 0;

    uint256 contractBefore = nativeBalances[currentContract];
    uint256 owed = currentContract.balances[e.msg.sender];

    withdraw(e);

    uint256 contractAfter = nativeBalances[currentContract];
    assert currentContract.balances[e.msg.sender] == 0;
    assert contractAfter == contractBefore - owed;
}
