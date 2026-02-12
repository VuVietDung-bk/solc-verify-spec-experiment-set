methods {
    function run(uint256) external;
}

/// @title Subtracting more than count should not change state (benign underflow)
rule run_underflow_should_revert(env e, uint256 input) {
    require input > currentContract.count;

    uint256 beforeCount = currentContract.count;

    run(e, input);

    assert currentContract.count == beforeCount;
}
