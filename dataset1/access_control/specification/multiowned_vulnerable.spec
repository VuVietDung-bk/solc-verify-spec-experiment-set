variables
{
    mapping (address => address) owners;
    address root;
}

rule new_owner_requires_existing_owner(address candidate) {
    require owners[msg.sender] == address(0);
    address oldParent = owners[candidate];
    newOwner(candidate);
    assert owners[candidate] == oldParent;
}
