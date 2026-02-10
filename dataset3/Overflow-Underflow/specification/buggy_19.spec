variables
{
    mapping(address => uint) balances_intou2;
    mapping(address => uint) lockTime_intou1;
}

rule transfer_undrflow2_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou2[msg.sender] == 0;
    transfer_undrflow2(to, value);
    assert_revert;
}

rule increaseLockTime_intou1_monotonic(uint inc) {
    uint before = lockTime_intou1[msg.sender];
    increaseLockTime_intou1(inc);
    uint afterTime = lockTime_intou1[msg.sender];
    assert afterTime > before;
}
