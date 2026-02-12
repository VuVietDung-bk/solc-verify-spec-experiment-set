methods {
    function transfer(address, uint256) external;
}

/// @title Transfer must conserve balances: sender -= value, receiver += value
rule transfer_balance_conservation(env e, address _to, uint256 _value) {
    require _to != e.msg.sender;

    uint256 sender_before = currentContract.balances[e.msg.sender];
    uint256 to_before = currentContract.balances[_to];

    transfer(e, _to, _value);

    uint256 sender_after = currentContract.balances[e.msg.sender];
    uint256 to_after = currentContract.balances[_to];

    assert sender_before >= _value;
    assert sender_after == sender_before - _value;
    assert to_after == to_before + _value;
}
