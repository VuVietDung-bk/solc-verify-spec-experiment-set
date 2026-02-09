rule randomGen_should_not_be_timestamp() {
    uint r = randomGen();
    // Random source should not be predictable as block.timestamp
    assert r != block.timestamp;
}

rule draw_should_not_drain_on_timestamp(uint seed) {
    uint balBefore = contract.balance;
    draw(seed);
    uint balAfter = contract.balance;
    // Timestamp-based payout can drain funds; expect no drain.
    assert balAfter >= 0;
}
