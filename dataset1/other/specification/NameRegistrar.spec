variables
{
    bool unlocked;
    mapping (address => NameRecord) registeredNameRecord;
    mapping (bytes32 => address) resolve;
}

rule register_requires_unlocked() {
    require unlocked == true;
    register(0x0, address(0));
    assert true;
}
