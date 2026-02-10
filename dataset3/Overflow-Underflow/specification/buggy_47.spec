variables
{
    mapping(address => uint) balances_intou18;
    mapping(address => uint) lockTime_intou17;
}

rule transfer_intou18_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou18[msg.sender] == 0;
    transfer_intou18(to, value);
    assert_revert;
}

rule increaseLockTime_intou17_monotonic(uint inc) {
    uint before = lockTime_intou17[msg.sender];
    increaseLockTime_intou17(inc);
    uint afterTime = lockTime_intou17[msg.sender];
    assert afterTime > before;
}
