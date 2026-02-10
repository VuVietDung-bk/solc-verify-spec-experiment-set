variables
{
    mapping(address => uint) balances_intou10;
    mapping(address => uint) lockTime_intou21;
}

rule transfer_intou10_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou10[msg.sender] == 0;
    transfer_intou10(to, value);
    assert_revert;
}

rule increaseLockTime_intou21_monotonic(uint inc) {
    uint before = lockTime_intou21[msg.sender];
    increaseLockTime_intou21(inc);
    uint afterTime = lockTime_intou21[msg.sender];
    assert afterTime > before;
}
