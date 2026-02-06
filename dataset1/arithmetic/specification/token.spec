variables
{
    mapping (address => uint) balances;
    uint totalSupply;
}

rule transfer_balance_conservation(address _to, uint _value) {
    uint sender_before = balances[msg.sender];
    uint to_before = balances[_to];
    transfer(_to, _value);
    uint sender_after = balances[msg.sender];
    uint to_after = balances[_to];
    assert sender_before >= _value;
    assert sender_after == sender_before - _value;
    assert to_after == to_before + _value;
}
