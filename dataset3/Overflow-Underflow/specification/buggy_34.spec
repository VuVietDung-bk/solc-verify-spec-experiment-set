variables
{
    mapping(address => uint) balances_intou34;
}

rule transfer_intou34_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou34[msg.sender] == 0;
    transfer_intou34(to, value);
    assert_revert;
}
