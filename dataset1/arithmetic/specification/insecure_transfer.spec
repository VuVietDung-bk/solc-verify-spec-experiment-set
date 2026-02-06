variables
{
    mapping (address => uint256) balanceOf;
}

rule transfer_conserves(address _to, uint256 _value) {
    require balanceOf[msg.sender] >= _value;
    uint256 sender_before = balanceOf[msg.sender];
    uint256 to_before = balanceOf[_to];

    transfer(_to, _value);

    uint256 sender_after = balanceOf[msg.sender];
    uint256 to_after = balanceOf[_to];

    assert sender_after == sender_before - _value;
    assert to_after == to_before + _value;
}
