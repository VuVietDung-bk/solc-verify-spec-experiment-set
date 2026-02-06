variables {
    address winner_tmstmp19;
    address winner_tmstmp26;
    address winner_tmstmp7;
    address winner_tmstmp23;
    address winner_tmstmp14;
    address winner_tmstmp30;
    address winner_tmstmp39;
    address winner_tmstmp35;
    address winner_tmstmp27;
    address winner_tmstmp31;
    address winner_tmstmp38;
}

rule play_tmstmp19_respects_condition(uint startTime) {
    address prev = winner_tmstmp19;

    play_tmstmp19(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp19 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp19 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp26_respects_condition(uint startTime) {
    address prev = winner_tmstmp26;

    play_tmstmp26(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp26 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp26 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp7_respects_condition(uint startTime) {
    address prev = winner_tmstmp7;

    play_tmstmp7(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp7 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp7 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp23_respects_condition(uint startTime) {
    address prev = winner_tmstmp23;

    play_tmstmp23(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp23 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp23 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp14_respects_condition(uint startTime) {
    address prev = winner_tmstmp14;

    play_tmstmp14(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp14 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp14 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp30_respects_condition(uint startTime) {
    address prev = winner_tmstmp30;

    play_tmstmp30(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp30 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp30 == prev,
            "winner must remain unchanged when condition fails";
    }
}

rule play_tmstmp39_respects_condition(uint startTime) {
    address prev = winner_tmstmp39;

    play_tmstmp39(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp39 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp39 == prev,
            "winner must remain unchanged when condition fails";
    }
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

rule play_tmstmp38_respects_condition(uint startTime) {
    address prev = winner_tmstmp38;

    play_tmstmp38(startTime);

    if (startTime + 5 * 1 days == block.timestamp) {
        assert winner_tmstmp38 == msg.sender,
            "winner must update to caller when condition holds";
    } else {
        assert winner_tmstmp38 == prev,
            "winner must remain unchanged when condition fails";
    }
}
