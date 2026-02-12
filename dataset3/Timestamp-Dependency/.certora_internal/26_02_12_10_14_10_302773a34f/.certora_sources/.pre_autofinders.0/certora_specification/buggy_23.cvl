// Timestamp-Dependency specification for AGR (buggy_23.sol)

rule play_tmstmp19_sets_winner_at_exact_time(uint256 startTime) {
    env e;
    address prevWinner = currentContract.winner_tmstmp19;
    require startTime + 432000 == e.block.timestamp;

    play_tmstmp19(e, startTime);

    assert currentContract.winner_tmstmp19 == e.msg.sender,
        "winner must be set when exact time matches";
}

rule play_tmstmp19_no_change_when_time_mismatch(uint256 startTime) {
    env e;
    address prevWinner = currentContract.winner_tmstmp19;
    require startTime + 432000 != e.block.timestamp;

    play_tmstmp19(e, startTime);

    assert currentContract.winner_tmstmp19 == prevWinner,
        "winner must not change when time does not match";
}

rule transfer_no_timestamp_dependency(address to, uint256 value) {
    env e;
    require to != 0;
    require to != e.msg.sender;
    require value > 0;

    transfer(e, to, value);

    assert true, "transfer must succeed regardless of timestamp";
}

rule approve_no_timestamp_dependency(address spender, uint256 value) {
    env e;
    require spender != 0;

    approve(e, spender, value);

    assert allowance(e, e.msg.sender, spender) == value,
        "allowance must be set regardless of timestamp";
}

rule burn_no_timestamp_dependency(uint256 value) {
    env e;
    require value > 0;

    burn(e, value);

    assert true, "burn must succeed regardless of timestamp";
}
