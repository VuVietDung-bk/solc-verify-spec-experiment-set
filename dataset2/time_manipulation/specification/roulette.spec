rule fallback_should_not_payout_on_timestamp() {
    require msg.value > 0;

    uint balBefore = contract.balance;
    fallback();
    uint balAfter = contract.balance;

    // Winning depends on block.timestamp; expect house balance to increase by the bet.
    assert balAfter == balBefore + msg.value;
}
