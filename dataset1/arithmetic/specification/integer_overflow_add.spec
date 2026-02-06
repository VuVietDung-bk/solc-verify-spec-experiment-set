variables
{
    uint count;
}

rule add_no_overflow(uint256 input) {
    uint beforeCount = count;
    run(input);
    uint afterCount = count;
    assert afterCount == beforeCount + input;
}
