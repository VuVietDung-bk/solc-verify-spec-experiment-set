// Unhandled-Exceptions specification for AGR (buggy_23.sol)

rule callnotchecked_unchk13_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk13(e, callee);
    assert true, "call() return value is not checked";
}
