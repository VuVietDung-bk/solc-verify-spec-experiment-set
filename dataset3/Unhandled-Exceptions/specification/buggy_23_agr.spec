rule callnotchecked_unchk13_ignores_call_failure(address callee) {
    callnotchecked_unchk13(callee);
    // Bug: call() return value is not checked
}
