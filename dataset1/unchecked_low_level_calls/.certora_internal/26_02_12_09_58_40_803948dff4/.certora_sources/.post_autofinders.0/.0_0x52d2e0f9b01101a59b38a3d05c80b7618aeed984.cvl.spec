methods {
    function getTokens(uint256, address) external;
}

/// @title Low-level call in loop may fail silently
rule getTokens_should_succeed(env e, address addr, uint256 num) {
    getTokens@withrevert(e, num, addr);

    assert lastReverted,
        "Low-level call in loop may fail silently";
}
