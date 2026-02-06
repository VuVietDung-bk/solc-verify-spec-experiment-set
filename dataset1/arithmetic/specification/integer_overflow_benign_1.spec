variables
{
    uint count;
}

rule run_underflow_should_revert(uint256 input) {
    require input > count;
    uint beforeCount = count;
    run(input);
    assert count == beforeCount;
}
