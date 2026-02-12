methods {
    function approve(address, uint256) external;
}

/// @title approve correctly sets allowance
rule balance_query_safe(env e) {
    address s = e.msg.sender;
    uint256 v = 5;

    approve(e, s, v);

    assert currentContract._allowed[s][s] == v;
}
