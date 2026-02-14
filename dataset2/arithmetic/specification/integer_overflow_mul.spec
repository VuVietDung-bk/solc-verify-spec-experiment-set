variables
{
    uint count;
}

rule mul_no_overflow(uint256 input) {
    uint beforeCount = count;
    run(input);
    uint afterCount = count;
    assert afterCount == beforeCount * input;
}
