methods {
    function run(uint256) external;
}

/// @title run(add) must not overflow: result == old + input
rule add_no_overflow(env e, uint256 input) {
    uint256 beforeCount = currentContract.count;

    run(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount + input;
}
