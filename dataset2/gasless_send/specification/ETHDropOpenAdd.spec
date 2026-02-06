variables
{
    address secretary;
}

rule dripETH_unchecked() {
    require msg.sender == secretary;
    dripETH();
    assert true;
}
