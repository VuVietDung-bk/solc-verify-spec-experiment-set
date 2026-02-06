variables
{
    mapping (address => uint) balances;
    mapping (address => uint) lockTime;
}

rule locktime_monotone(uint inc) {
    uint beforeLock = lockTime[msg.sender];
    increaseLockTime(inc);
    uint afterLock = lockTime[msg.sender];
    assert afterLock == beforeLock + inc;
}
