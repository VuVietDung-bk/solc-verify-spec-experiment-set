variables
{
    address Owner;
}

rule Command_unchecked(address adr, bytes data) {
    require msg.sender == Owner;
    require adr != address(0);
    uint oldContractBalance = contract.balance;
    uint oldDstBalance = adr.balance;
    Command(adr, data);
    assert contract.balance == oldContractBalance - msg.value;
    assert adr.balance == oldDstBalance + msg.value;
}
