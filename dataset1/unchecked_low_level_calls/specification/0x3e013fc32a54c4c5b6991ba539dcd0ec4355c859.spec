variables
{
    address Owner;
}

rule Command_unchecked(address adr, bytes data) {
    require msg.sender == Owner;
    Command(adr, data);
    // Unchecked low-level call may fail silently
    uint balAfter = contract.balance;
    // Expect value sent with the call to leave the contract
    assert balAfter == __verifier_old_uint(contract.balance) - msg.value;
}
