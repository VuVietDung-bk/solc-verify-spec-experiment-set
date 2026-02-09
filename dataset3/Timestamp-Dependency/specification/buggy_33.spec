variables {
    address winner_tmstmp23;
}

// Test for play_tmstmp23 - timestamp dependency vulnerability
// Bug: Exact timestamp match is nearly impossible and manipulable by miners
rule play_tmstmp23_when_condition_holds(uint startTime) {
    address prev = winner_tmstmp23;
    require startTime + 432000 == block.timestamp;

    play_tmstmp23(startTime);

    assert winner_tmstmp23 == msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp23_when_condition_fails(uint startTime) {
    address prev = winner_tmstmp23;
    require startTime + 432000 != block.timestamp;

    play_tmstmp23(startTime);

    assert winner_tmstmp23 == prev,
        "winner must remain unchanged when condition fails";
}