variables {
    address winner_tmstmp35;
    address winner_tmstmp27;
    address winner_tmstmp31;
}

rule play_tmstmp35_respects_condition(uint startTime) {
    address prev = winner_tmstmp35;

    play_tmstmp35(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp35 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp35 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp27_respects_condition(uint startTime) {
    address prev = winner_tmstmp27;

    play_tmstmp27(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp27 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp27 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp31_respects_condition(uint startTime) {
    address prev = winner_tmstmp31;

    play_tmstmp31(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp31 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp31 == prev,
            "winner must remain unchanged when condition fails";
    }
}
