variables
{
    address owner;
    mapping (address => uint) balances;
}

rule withdraw_gasless(address client) {
    require msg.sender == owner;
    require balances[client] > 0;
    withdraw(client);
    assert true;
}

rule credit_gasless() {
    credit();
    assert true;
}
