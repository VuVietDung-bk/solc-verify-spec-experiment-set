rule callnotchecked_may_fail(address callee) {
    callnotchecked(callee);
    assert true;
}
