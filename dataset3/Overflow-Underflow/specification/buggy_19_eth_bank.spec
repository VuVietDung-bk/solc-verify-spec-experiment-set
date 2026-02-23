variables
{
    mapping(address => uint) balances_intou2;
}

rule transfer_undrflow2_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou2[msg.sender] == 0;
    transfer_undrflow2(to, value);
    assert_revert;
}
