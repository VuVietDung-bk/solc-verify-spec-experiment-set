variables
{
    mapping (address => uint) userBalances;
}

rule withdraw_zeroes_balance() {
    withdrawBalance();
    assert userBalances[msg.sender] == 0;
}
