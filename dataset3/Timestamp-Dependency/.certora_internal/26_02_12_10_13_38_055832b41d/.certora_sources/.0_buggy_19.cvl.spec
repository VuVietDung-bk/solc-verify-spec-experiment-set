// Timestamp-Dependency specification for ethBank (buggy_19.sol)

rule play_tmstmp3_when_condition_holds(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp3;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp3(e, startTime);

    assert currentContract.winner_tmstmp3 == e.msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp3_when_condition_fails(uint startTime) {
    env e;
    address prev = currentContract.winner_tmstmp3;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp3(e, startTime);

    assert currentContract.winner_tmstmp3 == prev,
        "winner must remain unchanged when condition fails";
}
