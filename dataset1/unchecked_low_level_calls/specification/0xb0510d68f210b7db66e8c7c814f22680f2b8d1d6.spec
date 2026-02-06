variables
{
    address owner;
}

rule fundPuppets_unchecked() {
    require msg.sender == owner;
    fundPuppets();
    assert true;
}
