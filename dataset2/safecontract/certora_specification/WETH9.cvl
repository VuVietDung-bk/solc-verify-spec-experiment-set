methods {
    function deposit() external;
    function withdraw(uint256) external;
    function transferFrom(address, address, uint256) external returns (bool);
}

/// @title deposit increases user wrapped balance and contract ETH
rule depositIncreasesBalance(env e) {
    uint256 userBefore = currentContract.balanceOf[e.msg.sender];
    uint256 contractBefore = nativeBalances[currentContract];
    uint256 valueSent = e.msg.value;

    deposit(e);

    uint256 userAfter = currentContract.balanceOf[e.msg.sender];
    uint256 contractAfter = nativeBalances[currentContract];

    assert userAfter == userBefore + valueSent;
    assert contractAfter == contractBefore + valueSent;
}

/// @title withdraw decreases user wrapped balance and contract ETH
rule withdrawDecreasesBalance(env e, uint256 wad) {
    uint256 userBefore = currentContract.balanceOf[e.msg.sender];
    uint256 contractBefore = nativeBalances[currentContract];

    withdraw(e, wad);

    uint256 userAfter = currentContract.balanceOf[e.msg.sender];
    uint256 contractAfter = nativeBalances[currentContract];

    assert userAfter == userBefore - wad;
    assert contractAfter == contractBefore - wad;
}

/// @title transferFrom respects allowance (infinite allowance stays, finite decreases)
rule transferFromRespectsAllowance(env e, address src, address dst, uint256 wad) {
    uint256 srcBefore = currentContract.balanceOf[src];
    uint256 dstBefore = currentContract.balanceOf[dst];
    uint256 allowanceBefore = currentContract.allowance[src][e.msg.sender];

    transferFrom(e, src, dst, wad);

    uint256 srcAfter = currentContract.balanceOf[src];
    uint256 dstAfter = currentContract.balanceOf[dst];
    uint256 allowanceAfter = currentContract.allowance[src][e.msg.sender];

    assert dst != src => srcAfter == srcBefore - wad;
    assert dst != src => dstAfter == dstBefore + wad;
    assert dst == src => srcAfter == srcBefore;
    assert dst == src => dstAfter == dstBefore;

    assert (src != e.msg.sender && allowanceBefore != max_uint256) => (allowanceAfter == allowanceBefore - wad);
    assert (src == e.msg.sender || allowanceBefore == max_uint256) => (allowanceAfter == allowanceBefore);
}
