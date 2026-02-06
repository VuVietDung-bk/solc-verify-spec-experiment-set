variables
{
    uint count;
}

rule add_state_no_overflow(uint256 input) {
    uint beforeCount = count;
    overflowaddtostate(input);
    uint afterCount = count;
    assert afterCount == beforeCount + input;
}

rule mul_state_no_overflow(uint256 input) {
    uint beforeCount = count;
    overflowmultostate(input);
    uint afterCount = count;
    assert afterCount == beforeCount * input;
}

rule sub_state_no_underflow(uint256 input) {
    require input <= count;
    uint beforeCount = count;
    underflowtostate(input);
    uint afterCount = count;
    assert afterCount == beforeCount - input;
}
