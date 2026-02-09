variables {
    address winner_tmstmp3;
}

rule play_tmstmp3_when_condition_holds(uint startTime) {
    address prev = winner_tmstmp3;
    require startTime + 432000 == block.timestamp;

    play_tmstmp3(startTime);

    assert winner_tmstmp3 == msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp3_when_condition_fails(uint startTime) {
    address prev = winner_tmstmp3;
    require startTime + 432000 != block.timestamp;

    play_tmstmp3(startTime);

    assert winner_tmstmp3 == prev,
        "winner must remain unchanged when condition fails";
}
