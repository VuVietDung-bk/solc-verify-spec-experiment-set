variables
{
    address owner;
}

rule change_owner_requires_owner(address attacker, address newOwner) {
    require owner != address(0);
    require attacker != owner;
    require msg.sender == attacker;

    address oldOwner = owner;
    changeOwner(newOwner);

    // Without onlyowner, attacker can seize control; expect owner to remain unchanged.
    assert owner == oldOwner;
}
