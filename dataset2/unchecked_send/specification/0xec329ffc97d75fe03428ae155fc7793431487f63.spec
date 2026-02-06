variables
{
    address owner;
}

rule execute_unchecked(address dst, uint value, bytes data) {
    require msg.sender == owner;
    execute(dst, value, data);
    assert true;
}
