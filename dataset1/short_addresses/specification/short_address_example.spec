variables
{
    mapping (address => uint) balances;
}

rule sendCoin_respects_balance(address to, uint amount) {
    require balances[msg.sender] >= amount;
    sendCoin(to, amount);
    assert balances[msg.sender] >= 0;
    assert balances[to] >= amount;
}
