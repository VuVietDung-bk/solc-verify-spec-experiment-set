methods {
    function deposit() external;
    function withdraw(uint256) external;
    function refund() external;
    function migrateTo(address) external;
}

/// @title After refund, user balance must be reset to 0
rule integrity_of_refund(env e) {
    uint256 balance_before = currentContract.balances[e.msg.sender];
    require balance_before > 0;

    refund(e);

    uint256 balance_after = currentContract.balances[e.msg.sender];
    assert balance_after == 0,
        "Vulnerability: balance not reset to 0 after refund";
}

/// @title Withdraw must decrease balance by exact amount
rule balance_consistency_on_withdraw(env e, uint256 amount) {
    uint256 balance_before = currentContract.balances[e.msg.sender];
    require amount <= balance_before;

    withdraw(e, amount);

    uint256 balance_after = currentContract.balances[e.msg.sender];
    assert balance_after == balance_before - amount,
        "Error: balance not updated correctly after withdraw";
}

/// @title Only creator can call migrateTo
rule only_creator_can_migrate(env e, address to) {
    require e.msg.sender != currentContract.creator;

    migrateTo@withrevert(e, to);

    assert lastReverted,
        "Vulnerability: non-creator can migrate funds";
}

/// @title Refund must reduce the contract's ether balance
rule refund_affects_contract_balance(env e) {
    uint256 contract_balance_before = nativeBalances[currentContract];
    uint256 user_storage_balance = currentContract.balances[e.msg.sender];
    require user_storage_balance > 0;
    require contract_balance_before >= user_storage_balance;

    refund(e);

    uint256 contract_balance_after = nativeBalances[currentContract];
    assert contract_balance_after == contract_balance_before - user_storage_balance;
}
