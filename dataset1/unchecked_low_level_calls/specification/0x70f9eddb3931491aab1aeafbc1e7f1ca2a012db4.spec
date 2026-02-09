variables {
    address Owner;
}

rule Command_must_debit(address adr, bytes data) {
    require msg.sender == Owner;
    uint balBefore = contract.balance;
    Command(adr, data);
    uint balAfter = contract.balance;
    assert balAfter == balBefore - msg.value;
}
