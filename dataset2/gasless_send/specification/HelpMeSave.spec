variables
{
    address owner;
}

rule withdraw_gasless() {
    MyTestWallet7();
    withdraw();
    assert true;
}
