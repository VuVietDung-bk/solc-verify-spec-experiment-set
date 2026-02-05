variables
{
    address owner;
}

rule change_owner_requires_owner(address newOwner) {
    require msg.sender != owner;
    address oldOwner = owner;
    changeOwner(newOwner);
    assert owner == oldOwner;
}
