variables
{
    address Owner;
}

rule command_unchecked(address adr, bytes data) {
    require msg.sender == Owner;
    Command(adr, data);
    assert true;
}
