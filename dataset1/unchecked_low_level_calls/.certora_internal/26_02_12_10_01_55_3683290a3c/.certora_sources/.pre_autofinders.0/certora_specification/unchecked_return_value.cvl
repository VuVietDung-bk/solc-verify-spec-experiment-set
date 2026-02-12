methods {
    function callnotchecked(address) external;
}

/// @title Unchecked low-level call should revert on failure
rule callnotchecked_should_revert_on_failure(env e, address callee) {
    callnotchecked@withrevert(e, callee);

    assert lastReverted;
}
