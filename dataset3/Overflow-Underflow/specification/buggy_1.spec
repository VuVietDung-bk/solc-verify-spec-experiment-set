variables
{
    mapping(address => uint) balances_intou14;
    mapping(address => uint) lockTime_intou13;
}

rule transfer_intou14_should_not_underflow(address to, uint value) {
    // Sender has zero balance; transferring positive value should revert to avoid underflow.
    require value > 0;
    require balances_intou14[msg.sender] == 0;
    transfer_intou14(to, value);
    assert_revert;
}

rule increaseLockTime_intou13_should_not_overflow(uint delta) {
    // Overflow can reduce lock time and allow early withdrawal; enforce monotonic increase.
    uint before = lockTime_intou13[msg.sender];
    increaseLockTime_intou13(delta);
    uint afterTime = lockTime_intou13[msg.sender];
    assert afterTime > before;
}
