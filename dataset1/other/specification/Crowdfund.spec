rule stake_should_not_overflow() {
    // Stake three times with 100 finney to drive uint8 past 255.
    require msg.value == 100000000000000000; // 100 finney

    uint8 s1 = stakes[msg.sender];
    stake();
    uint8 s2 = stakes[msg.sender];

    // Stakes should increase monotonically for the same sender.
    assert s2 > s1;
}
