variables
{
    address Owner;
}

rule Command_unchecked(address payable adr, bytes data) {
    require msg.sender == Owner;
    Command(adr, data);
    assert true;
}
