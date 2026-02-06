variables
{
    address owner;
}

rule distributeAirdrop_unchecked(uint index, address[] addrs, uint[] vals) {
    require msg.sender == owner;
    distributeAirdrop(index, addrs, vals);
    assert true;
}
