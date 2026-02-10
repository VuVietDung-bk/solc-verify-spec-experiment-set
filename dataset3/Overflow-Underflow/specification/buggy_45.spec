variables
{
    // Match StockBet fields
    mapping(address => uint) lockTime_intou33;
    mapping(address => uint) balances_intou2;
}

rule increaseLockTime_intou17_monotonic(uint inc) {
    uint before = lockTime_intou33[msg.sender];
    increaseLockTime_intou33(inc);
    uint afterTime = lockTime_intou33[msg.sender];
    assert afterTime > before;
}

rule transfer_intou26_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou2[msg.sender] == 0;
    transfer_undrflow2(to, value);
    assert_revert;
}
