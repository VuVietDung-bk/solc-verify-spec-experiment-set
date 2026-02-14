methods {
    function overflowaddtostate(uint256) external;
    function overflowmultostate(uint256) external;
    function underflowtostate(uint256) external;
}

/// @title Addition to state must not overflow
rule add_state_no_overflow(env e, uint256 input) {
    uint256 beforeCount = currentContract.count;

    overflowaddtostate(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount + input;
}

/// @title Multiplication to state must not overflow
rule mul_state_no_overflow(env e, uint256 input) {
    uint256 beforeCount = currentContract.count;

    overflowmultostate(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount * input;
}

/// @title Subtraction from state must not underflow
rule sub_state_no_underflow(env e, uint256 input) {
    require input <= currentContract.count;

    uint256 beforeCount = currentContract.count;

    underflowtostate(e, input);

    uint256 afterCount = currentContract.count;
    assert afterCount == beforeCount - input;
}
