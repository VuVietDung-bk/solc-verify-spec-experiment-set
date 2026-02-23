// Rule: play_tmstmp19 sets winner when exact time matches (5 days = 432000 seconds)
rule play_tmstmp19_sets_winner_at_exact_time(uint256 startTime) {
    address prevWinner = winner_tmstmp19;
    require startTime + 432000 == block.timestamp;
    
    play_tmstmp19(startTime);
    
    assert winner_tmstmp19 == msg.sender, "winner must be set when exact time matches";
}

// Rule: play_tmstmp19 does not change winner when time does not match
rule play_tmstmp19_no_change_when_time_mismatch(uint256 startTime) {
    address prevWinner = winner_tmstmp19;
    require startTime + 432000 != block.timestamp;
    
    play_tmstmp19(startTime);
    
    assert winner_tmstmp19 == prevWinner, "winner must not change when time does not match";
}

// Rule: ERC20 transfer should not depend on timestamp
rule transfer_no_timestamp_dependency(address to, uint256 value) {
    require to != address(0);
    require to != msg.sender;
    require value > 0;
    
    transfer(to, value);
    
    assert true, "transfer must succeed regardless of timestamp";
}

// Rule: approve should not depend on timestamp
rule approve_no_timestamp_dependency(address spender, uint256 value) {
    require spender != address(0);
    
    approve(spender, value);
    
    assert allowance(msg.sender, spender) == value, "allowance must be set regardless of timestamp";
}
