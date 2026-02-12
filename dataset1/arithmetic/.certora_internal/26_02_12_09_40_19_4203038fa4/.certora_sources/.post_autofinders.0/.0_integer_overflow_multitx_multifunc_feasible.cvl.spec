methods {
    function run(uint256) external;
}

/// @title After init (initialized==1), run subtracts correctly
rule run_after_init(env e, uint256 input) {
    require currentContract.initialized == 1;

    uint256 beforeCount = currentContract.count;

    run(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount - input;
}
