variables
{
    uint count;
}

rule sub_no_underflow(uint256 input) {
    require input <= count;
    uint beforeCount = count;
    run(input);
    uint afterCount = count;
    assert afterCount == beforeCount - input;
}
