methods {
    function bug_tmstmp32() external;
}

/// @title bug_tmstmp32 should not drain balance
rule bug_tmstmp32_should_not_drain_balance(env e) {
    require e.msg.value > 0;

    uint256 balBefore = nativeBalances[currentContract];

    bug_tmstmp32(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore + e.msg.value;
}
