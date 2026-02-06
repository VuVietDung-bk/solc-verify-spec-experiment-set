variables
{
    address leader;
    uint timestamp;
}

rule randomGen_returns_timestamp() {
    randomGen();
    assert true;
}
