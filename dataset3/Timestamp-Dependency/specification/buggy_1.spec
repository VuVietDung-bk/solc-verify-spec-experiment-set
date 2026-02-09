variables {
    address winner_tmstmp39;
}

rule play_tmstmp39_when_condition_holds(uint startTime) {
    address prev = winner_tmstmp39;
    require startTime + 432000 == block.timestamp;

    play_tmstmp39(startTime);

    assert winner_tmstmp39 == msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp39_when_condition_fails(uint startTime) {
    address prev = winner_tmstmp39;
    require startTime + 432000 != block.timestamp;

    play_tmstmp39(startTime);

    assert winner_tmstmp39 == prev,
        "winner must remain unchanged when condition fails";
}
