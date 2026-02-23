variables
{
    address owner;
}

rule go_unchecked() {
    uint balBefore = contract.balance;
    go();
    // Unchecked low-level call may fail silently
    // The call sends msg.value to target, then transfers balance to owner
    assert contract.balance == 0;
}
