methods {
    function spin() external;
}

/// @title Fallback/spin should not pay out based on timestamp; house balance must increase by bet
rule fallback_should_not_payout_on_timestamp(env e) {
    require e.msg.value > 0;

    uint256 balBefore = nativeBalances[currentContract];

    spin(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore + e.msg.value;
}
