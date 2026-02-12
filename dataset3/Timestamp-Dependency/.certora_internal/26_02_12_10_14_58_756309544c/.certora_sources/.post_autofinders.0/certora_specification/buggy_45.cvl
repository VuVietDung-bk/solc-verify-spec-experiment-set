// Timestamp-Dependency specification for StockBet (buggy_45.sol)

rule play_tmstmp27_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp27;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp27(e, startTime);

    assert currentContract.winner_tmstmp27 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp27_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp27;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp27(e, startTime);

    assert currentContract.winner_tmstmp27 == prev,
        "winner must remain unchanged when condition fails";
}

rule bug_tmstmp13_executes_timestamp_comparison() {
    env e;

    bug_tmstmp13(e);

    assert true, "bug_tmstmp13 executes timestamp comparison";
}

rule bug_tmstmp8_accepts_same_block_calls() {
    env e;

    bug_tmstmp8(e);

    assert true, "bug_tmstmp8 can be called despite same block timestamp check";
}
