variables
{
    address owner;
    uint depositsCount;
}

rule sendMoney_unchecked(address _target, uint _value, bytes _data) {
    require msg.sender == owner;
    uint balBefore = contract.balance;
    sendMoney(_target, _value, _data);
    // Unchecked low-level call may fail silently
    assert contract.balance == balBefore - _value;
}

rule only_owner_can_withdraw(uint _value) {
    require msg.sender != owner;
    withdraw(_value);
    assert_revert;
}

rule only_owner_can_sendMoney(address _target, uint _value, bytes _data) {
    require msg.sender != owner;
    sendMoney(_target, _value, _data);
    assert_revert;
}
