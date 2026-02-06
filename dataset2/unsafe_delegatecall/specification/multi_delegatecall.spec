rule multiDelegatecall_unsafe(bytes[] data) {
    multiDelegatecall(data);
    assert true;
}
