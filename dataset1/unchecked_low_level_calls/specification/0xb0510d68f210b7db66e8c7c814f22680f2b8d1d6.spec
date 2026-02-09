variables {
    address owner;
}

rule fundPuppets_must_spend_value() {
    require msg.sender == owner;
    uint balBefore = contract.balance;
    fundPuppets();
    uint balAfter = contract.balance;
    assert balAfter == balBefore - msg.value;
}
