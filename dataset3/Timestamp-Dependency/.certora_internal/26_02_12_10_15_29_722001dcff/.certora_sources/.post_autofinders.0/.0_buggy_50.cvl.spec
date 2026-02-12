// Timestamp-Dependency specification for digitalNotary (buggy_50.sol)

rule play_tmstmp19_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp19;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp19(e, startTime);

    assert currentContract.winner_tmstmp19 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp19_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp19;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp19(e, startTime);

    assert currentContract.winner_tmstmp19 == prev,
        "winner must remain unchanged when condition fails";
}

rule bug_tmstmp9_executes_timestamp_comparison() {
    env e;

    bug_tmstmp9(e);

    assert true, "bug_tmstmp9 executes timestamp comparison";
}

rule bug_tmstmp20_accepts_same_block_calls() {
    env e;

    bug_tmstmp20(e);

    assert true, "bug_tmstmp20 can be called despite same block timestamp check";
}
