methods {
    function run(uint256) external;
}

/// @title Subtraction must not underflow: result == old - input
rule sub_no_underflow(env e, uint256 input) {
    require input <= currentContract.count;

    uint256 beforeCount = currentContract.count;

    run(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount - input;
}
