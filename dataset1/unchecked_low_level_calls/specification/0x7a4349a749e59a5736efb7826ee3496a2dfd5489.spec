variables
{
    address Owner;
}

rule Command_unchecked(address adr, bytes data) {
    require msg.sender == Owner;
    uint balBefore = contract.balance;
    Command(adr, data);
    // Unchecked low-level call may fail silently
    assert contract.balance == balBefore - msg.value;
}

rule only_owner_can_Command(address adr, bytes data) {
    require msg.sender != Owner;
    Command(adr, data);
    assert_revert;
}

rule only_owner_can_withdraw() {
    require msg.sender != Owner;
    withdraw();
    assert_revert;
}
