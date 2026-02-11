rule bug_tmstmp40_should_not_drain_balance() {
    require msg.value > 0;

    uint balBefore = contract.balance;
    bug_tmstmp40();
    uint balAfter = contract.balance;

    assert balAfter == balBefore + msg.value;
}
