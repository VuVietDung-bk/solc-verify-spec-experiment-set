methods {
    function run(uint256) external;
}

/// @title Multiplication must not overflow: result == old * input
rule mul_no_overflow(env e, uint256 input) {
    uint256 beforeCount = currentContract.count;

    run(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount * input;
}
