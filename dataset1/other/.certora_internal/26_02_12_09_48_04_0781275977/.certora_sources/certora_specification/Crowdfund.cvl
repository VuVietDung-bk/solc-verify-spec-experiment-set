methods {
    function stake() external;
}

/// @title Staking should increase stakes monotonically (detects uint8 overflow)
rule stake_should_not_overflow(env e) {
    require e.msg.value == 100000000000000000;

    uint8 s1 = currentContract.stakes[e.msg.sender];

    stake(e);

    uint8 s2 = currentContract.stakes[e.msg.sender];
    assert s2 > s1;
}
