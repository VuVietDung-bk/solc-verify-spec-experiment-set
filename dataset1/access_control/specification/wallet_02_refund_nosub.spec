variables
{
    mapping (address => uint256) balances;
}

rule refund_clears_balance() {
    require balances[msg.sender] > 0;
    refund();
    assert balances[msg.sender] == 0;
}
