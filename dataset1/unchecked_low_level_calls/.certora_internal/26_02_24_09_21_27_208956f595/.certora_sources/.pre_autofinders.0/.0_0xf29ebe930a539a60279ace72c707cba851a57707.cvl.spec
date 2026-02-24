methods {
    function go() external;
    function owner() external returns (address) envfree;
}

/// @title go function depletes contract balance
rule go_unchecked(env e) {
    uint256 balBefore = nativeBalances[currentContract];

    go(e);

    uint256 balAfter = nativeBalances[currentContract];
    // After go(), balance should be zero (sent to owner)
    assert balAfter == 0;
}

/// @title Unchecked call may silently fail
rule go_call_should_check_return(env e) {
    go@withrevert(e);
    // The call to hardcoded address is unchecked
    // This rule exists to document the vulnerability
    assert !lastReverted => nativeBalances[currentContract] == 0;
}
