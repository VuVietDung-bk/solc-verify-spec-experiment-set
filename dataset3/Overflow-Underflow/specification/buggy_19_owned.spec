variables
{
    mapping(address => uint) lockTime_intou1;
}

rule increaseLockTime_intou1_monotonic(uint inc) {
    uint before = lockTime_intou1[msg.sender];
    increaseLockTime_intou1(inc);
    uint afterTime = lockTime_intou1[msg.sender];
    assert afterTime > before;
}
