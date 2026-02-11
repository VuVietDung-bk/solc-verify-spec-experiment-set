variables
{
    mapping(address => uint) lockTime_intou21;
}

rule increaseLockTime_intou21_monotonic(uint inc) {
    uint before = lockTime_intou21[msg.sender];
    increaseLockTime_intou21(inc);
    uint afterTime = lockTime_intou21[msg.sender];
    assert afterTime > before;
}
