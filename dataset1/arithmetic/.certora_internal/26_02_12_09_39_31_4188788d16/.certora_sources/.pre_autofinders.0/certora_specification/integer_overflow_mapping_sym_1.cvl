methods {
    function init(uint256, uint256) external;
}

/// @title init underflow: map[k] -= v should equal old - v
rule init_underflow_should_revert(env e, uint256 k, uint256 v) {
    require v > currentContract.map[k];

    uint256 beforeVal = currentContract.map[k];

    init(e, k, v);

    uint256 afterVal = currentContract.map[k];
    assert afterVal == beforeVal - v;
}
