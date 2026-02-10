variables
{
    // Match contract fields in Owned/Staking
    mapping(address => uint) balances_intou38;
    mapping(address => uint) lockTime_intou17;
}

rule transfer_undrflow2_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou38[msg.sender] == 0;
    transfer_intou38(to, value);
    assert_revert;
}

rule increaseLockTime_intou33_monotonic(uint inc) {
    uint before = lockTime_intou17[msg.sender];
    increaseLockTime_intou17(inc);
    uint afterTime = lockTime_intou17[msg.sender];
    assert afterTime > before;
}
