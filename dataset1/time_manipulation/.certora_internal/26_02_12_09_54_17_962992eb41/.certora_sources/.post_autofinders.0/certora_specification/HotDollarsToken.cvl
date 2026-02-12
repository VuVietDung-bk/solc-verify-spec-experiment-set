methods {
    function bug_tmstmp36() external;
}

/// @title bug_tmstmp36 should not drain balance; bet must increase contract holdings
rule bug_tmstmp36_should_not_drain_balance(env e) {
    require e.msg.value > 0;

    uint256 balBefore = nativeBalances[currentContract];

    bug_tmstmp36(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore + e.msg.value;
}
