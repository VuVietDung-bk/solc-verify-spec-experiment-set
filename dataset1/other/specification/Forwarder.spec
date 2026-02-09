variables
{
    address owner;
}

rule non_owner_forward_reverts(address to, bytes data) {
    require msg.sender != owner;
    forward(payable(to), data);
    assert_revert;
}
