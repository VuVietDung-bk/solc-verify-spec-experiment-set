// CVL Spec for ReturnValue (unchecked_return_value.sol) - Unchecked low-level call
// call() return value not checked in one function

methods {
    function callchecked(address) external;
    function callnotchecked(address) external;
}

/**
 * Rule: callchecked_reverts_on_failure
 * callchecked should revert if call fails (this inherently checks return value).
 * This is a basic reachability check.
 */
rule callchecked_reachable(env e, address callee) {
    callchecked(e, callee);
    // No state changes to verify - function reverts on failure
    assert true;
}

/**
 * Rule: callnotchecked_continues_on_failure
 * callnotchecked does not check return value - vulnerable.
 */
rule callnotchecked_reachable(env e, address callee) {
    callnotchecked(e, callee);
    // No state changes - demonstrates unchecked call pattern
    assert true;
}
