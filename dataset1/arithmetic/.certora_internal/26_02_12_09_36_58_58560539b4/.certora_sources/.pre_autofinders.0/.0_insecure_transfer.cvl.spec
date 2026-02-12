methods {
    function transfer(address, uint256) external;
}

/// @title Transfer conserves total balance between sender and receiver
rule transfer_conserves(env e, address _to, uint256 _value) {
    require currentContract.balanceOf[e.msg.sender] >= _value;
    require _to != e.msg.sender;

    uint256 sender_before = currentContract.balanceOf[e.msg.sender];
    uint256 to_before = currentContract.balanceOf[_to];

    transfer(e, _to, _value);

    uint256 sender_after = currentContract.balanceOf[e.msg.sender];
    uint256 to_after = currentContract.balanceOf[_to];

    assert sender_after == sender_before - _value;
    assert to_after == to_before + _value;
}
