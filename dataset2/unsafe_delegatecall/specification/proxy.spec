rule forward_delegatecall(address callee, bytes data) {
    forward(callee, data);
    assert true;
}
