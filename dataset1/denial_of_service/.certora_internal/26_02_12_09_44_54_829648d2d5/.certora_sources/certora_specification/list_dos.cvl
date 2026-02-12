methods {
    function lendGovernmentMoney(address) external;
    function inheritToNextGeneration(address) external;
}

/// @title After timeout with many creditors, round increments (reset triggered)
rule reset_availability(env e, address buddy) {
    uint8 round_before = currentContract.round;
    uint256 timeout = 43200;

    require e.block.timestamp > currentContract.lastTimeOfNewCredit + timeout;
    require currentContract.creditorAddresses.length > 2000;

    lendGovernmentMoney(e, buddy);

    assert currentContract.round == round_before + 1;
}

/// @title After timeout, creditor list is cleared
rule reset_state_cleared(env e, address buddy) {
    uint256 timeout = 43200;

    require e.block.timestamp > currentContract.lastTimeOfNewCredit + timeout;
    require currentContract.creditorAddresses.length > 10;

    lendGovernmentMoney(e, buddy);

    assert currentContract.creditorAddresses.length == 0;
}

/// @title Only corruptElite can transfer elite role
rule elite_inheritance_access_control(env e, address nextGeneration) {
    address current_elite = currentContract.corruptElite;

    inheritToNextGeneration(e, nextGeneration);

    assert e.msg.sender == current_elite => currentContract.corruptElite == nextGeneration;
}

/// @title Lending before timeout adds one creditor
rule creditor_addition_integrity(env e, address buddy) {
    uint256 length_before = currentContract.creditorAddresses.length;
    uint256 timeout = 43200;

    require e.block.timestamp <= currentContract.lastTimeOfNewCredit + timeout;
    require e.msg.value >= 1000000000000000000;

    lendGovernmentMoney(e, buddy);

    assert currentContract.creditorAddresses.length == length_before + 1;
}
