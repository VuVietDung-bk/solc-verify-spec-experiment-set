variables
{
    address callee;
    address owner;
}

rule forward_delegatecall(bytes data) {
    forward(data);
    assert true;
}
