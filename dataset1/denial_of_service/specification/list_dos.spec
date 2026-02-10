variables {
    uint32 lastCreditorPayedOut;
    uint256 lastTimeOfNewCredit;
    uint256 profitFromCrash;
    mapping(uint => address) creditorAddresses;
    mapping(uint => uint256) creditorAmounts;
    address corruptElite;
    mapping (address => uint256) buddies;
    uint8 round;
}

rule reset_availability(address buddy) {
    uint8 round_before = round;
    uint256 timeout = 43200;

    require block.timestamp > lastTimeOfNewCredit + timeout;
    require creditorAddresses.length > 2000;

    lendGovernmentMoney(buddy);

    assert round == round_before + 1;
}

rule reset_state_cleared(address buddy) {
    uint256 timeout = 43200;

    require block.timestamp > lastTimeOfNewCredit + timeout;
    require creditorAddresses.length > 10;

    lendGovernmentMoney(buddy);

    assert creditorAddresses.length == 0;
}

rule elite_inheritance_access_control(address nextGeneration) {
    address current_elite = corruptElite;

    inheritToNextGeneration(nextGeneration);

    assert msg.sender == current_elite => corruptElite == nextGeneration;
}

rule creditor_addition_integrity(address buddy) {
    uint256 length_before = creditorAddresses.length;
    uint256 timeout = 43200;

    require block.timestamp <= lastTimeOfNewCredit + timeout;
    require msg.value >= 1000000000000000000;

    lendGovernmentMoney(buddy);

    assert creditorAddresses.length == length_before + 1;
}