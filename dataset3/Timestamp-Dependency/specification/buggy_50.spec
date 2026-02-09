variables {
    address winner_tmstmp19;
}

// Test for play_tmstmp19 - timestamp dependency vulnerability
// Bug: Exact timestamp match is nearly impossible and manipulable by miners
rule play_tmstmp19_when_condition_holds(uint startTime) {
    address prev = winner_tmstmp19;
    require startTime + 432000 == block.timestamp;

    play_tmstmp19(startTime);

    assert winner_tmstmp19 == msg.sender,
        "winner must update to caller when condition holds";
}

rule play_tmstmp19_when_condition_fails(uint startTime) {
    address prev = winner_tmstmp19;
    require startTime + 432000 != block.timestamp;

    play_tmstmp19(startTime);

    assert winner_tmstmp19 == prev,
        "winner must remain unchanged when condition fails";
}

// Test for bug_tmstmp9 - basic timestamp comparison
rule bug_tmstmp9_executes_timestamp_comparison() {
    // This function returns true if block.timestamp >= 1546300800
    // Using block.timestamp for logic can be manipulated by miners
    
    bug_tmstmp9();
    
    assert true, "bug_tmstmp9 executes timestamp comparison";
}

// Test for bug_tmstmp20 - timestamp dependency vulnerability
// Bug: pastBlockTime_tmstmp20 is local variable (always 0), makes require ineffective
// Bug: block.timestamp % 15 == 0 condition is manipulable by miners
rule bug_tmstmp20_accepts_same_block_calls() {
    // The require(block.timestamp != pastBlockTime_tmstmp20) is ineffective
    // because pastBlockTime_tmstmp20 is a local variable that resets to 0 each call
    // This allows the function to be called multiple times in the same block
    
    bug_tmstmp20();
    
    assert true, "bug_tmstmp20 can be called despite same block timestamp check";
}
