// Timestamp-Dependency specification for TTC (buggy_5.sol)

rule play_tmstmp38_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp38;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp38(e, startTime);

    assert currentContract.winner_tmstmp38 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp38_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp38;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp38(e, startTime);

    assert currentContract.winner_tmstmp38 == prev,
        "winner must remain unchanged when condition fails";
}
