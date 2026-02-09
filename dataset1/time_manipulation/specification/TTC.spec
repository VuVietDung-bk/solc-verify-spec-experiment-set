rule bug_tmstmp32_should_not_drain_balance() {
    require msg.value > 0;

    uint balBefore = contract.balance;
    bug_tmstmp32();
    uint balAfter = contract.balance;

    assert balAfter == balBefore + msg.value;
}
