variables {
    address winner_tmstmp38;
}

rule play_tmstmp38_when_condition_holds(uint startTime) {
    address prev = winner_tmstmp38;
    require startTime + 432000 == block.timestamp;

    play_tmstmp38(startTime);

    assert winner_tmstmp38 == msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp38_when_condition_fails(uint startTime) {
    address prev = winner_tmstmp38;
    require startTime + 432000 != block.timestamp;

    play_tmstmp38(startTime);

    assert winner_tmstmp38 == prev,
        "winner must remain unchanged when condition fails";
}
