// Timestamp-Dependency specification for Staking (buggy_33.sol)

rule play_tmstmp23_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp23;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp23(e, startTime);

    assert currentContract.winner_tmstmp23 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp23_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp23;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp23(e, startTime);

    assert currentContract.winner_tmstmp23 == prev,
        "winner must remain unchanged when condition fails";
}
