methods {
    function deposit() external;
    function withdraw(uint256) external;
    function migrateTo(address) external;
}

/// @title User must not be able to withdraw more than their balance
rule withdraw_integrity(env e, uint256 amount) {
    uint256 balance_before = currentContract.balances[e.msg.sender];
    require amount > balance_before;
    require nativeBalances[currentContract] >= amount;

    withdraw@withrevert(e, amount);

    assert lastReverted,
        "Security failure: user can withdraw more than their balance";
}

/// @title Valid withdrawal must decrease user balance
rule balance_decreases_on_withdraw(env e, uint256 amount) {
    uint256 balance_before = currentContract.balances[e.msg.sender];
    require amount <= balance_before;
    require amount > 0;

    withdraw(e, amount);

    uint256 balance_after = currentContract.balances[e.msg.sender];
    assert balance_after < balance_before,
        "Integrity failure: balance must decrease after withdrawal";
}

/// @title Only creator can call migrateTo
rule only_creator_can_migrate(env e, address to) {
    require e.msg.sender != currentContract.creator;

    migrateTo@withrevert(e, to);

    assert lastReverted,
        "Vulnerability: non-creator can migrate funds";
}
