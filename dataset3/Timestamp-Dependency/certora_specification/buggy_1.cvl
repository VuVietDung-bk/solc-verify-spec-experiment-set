// Timestamp-Dependency specification for HotDollarsToken (buggy_1.sol)

rule play_tmstmp39_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp39;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp39(e, startTime);

    assert currentContract.winner_tmstmp39 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp39_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp39;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp39(e, startTime);

    assert currentContract.winner_tmstmp39 == prev,
        "winner must remain unchanged when condition fails";
}
