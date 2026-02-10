methods {
    function fundPuppets() external;
}

/// @title fundPuppets must spend msg.value from contract balance
rule fundPuppets_must_spend_value(env e) {
    require e.msg.sender == currentContract.owner;

    uint256 balBefore = nativeBalances[currentContract];

    fundPuppets(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - e.msg.value;
}
