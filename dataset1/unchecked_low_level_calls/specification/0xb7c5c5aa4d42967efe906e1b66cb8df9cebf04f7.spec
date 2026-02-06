variables
{
    mapping (address => uint256) balances;
}

rule withdraw_resets_balance() {
    require balances[msg.sender] > 0;
    withdraw();
    assert balances[msg.sender] == 0;
}
