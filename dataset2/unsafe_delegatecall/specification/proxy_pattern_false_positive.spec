variables
{
    address owner;
}

rule proxyCall_delegatecall(address to, bytes data) {
    proxyCall(to, data);
    assert true;
}
