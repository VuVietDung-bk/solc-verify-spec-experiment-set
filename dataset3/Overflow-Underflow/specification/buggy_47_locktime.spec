variables
{
    mapping(address => uint) lockTime_intou17;
}

rule increaseLockTime_intou17_monotonic(uint inc) {
    uint before = lockTime_intou17[msg.sender];
    increaseLockTime_intou17(inc);
    uint afterTime = lockTime_intou17[msg.sender];
    assert afterTime > before;
}
