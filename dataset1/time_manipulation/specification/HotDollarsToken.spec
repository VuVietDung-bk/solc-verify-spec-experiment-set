rule bug_tmstmp36_should_not_drain_balance() {
    require msg.value > 0;

    uint balBefore = contract.balance;
    bug_tmstmp36();
    uint balAfter = contract.balance;

    // Winning path pays out based on block.timestamp; expect no unexpected drain.
    assert balAfter == balBefore + msg.value;
}
