methods {
    function execute(address, uint256, bytes) external;
}

/// @title execute must debit contract balance by value
rule execute_must_debit_balance(env e, address dst, uint256 value, bytes data) {
    require e.msg.sender == currentContract.owner;

    uint256 balBefore = nativeBalances[currentContract];

    execute(e, dst, value, data);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - value;
}
