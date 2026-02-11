variables
{
    mapping(address => uint) balances_intou10;
}

rule transfer_intou10_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou10[msg.sender] == 0;
    transfer_intou10(to, value);
    assert_revert;
}
