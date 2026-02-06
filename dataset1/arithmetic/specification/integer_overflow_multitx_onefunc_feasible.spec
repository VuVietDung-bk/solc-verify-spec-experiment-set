variables
{
    uint256 initialized;
    uint256 count;
}

rule run_after_second_call(uint256 input) {
    require initialized == 1;
    uint256 beforeCount = count;
    run(input);
    uint256 afterCount = count;
    assert afterCount == beforeCount - input;
}
