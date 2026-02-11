variables
{
    mapping(address => uint) balances_intou18;
}

rule transfer_intou18_should_not_underflow(address to, uint value) {
    require value > 0;
    require balances_intou18[msg.sender] == 0;
    transfer_intou18(to, value);
    assert_revert;
}
