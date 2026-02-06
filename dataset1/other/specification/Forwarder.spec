variables
{
    address owner;
}

rule only_owner_can_forward(address to, bytes data) {
    require msg.sender == owner;
    forward(payable(to), data);
    assert true;
}
