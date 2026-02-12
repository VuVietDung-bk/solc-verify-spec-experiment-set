methods {
    function swap(address, address, uint256, uint256) external;
}

/// @title Swap updates pool balances consistently with AMM formula
rule swapUpdatesPoolConsistently(env e, address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut) {
    uint256 inPoolBefore = currentContract.pools[tokenIn].totalBalance;
    uint256 outPoolBefore = currentContract.pools[tokenOut].totalBalance;
    uint256 inWeight = currentContract.pools[tokenIn].totalWeight;
    uint256 outWeight = currentContract.pools[tokenOut].totalWeight;
    uint256 fee = currentContract.pools[tokenIn].swapFee;
    uint256 userInBefore = currentContract.pools[tokenIn].balances[e.msg.sender];
    uint256 userOutBefore = currentContract.pools[tokenOut].balances[e.msg.sender];

    uint256 amountInWithFee = amountIn * (1000 - fee);
    uint256 expectedOutNumerator = amountInWithFee * outPoolBefore * outWeight;
    uint256 expectedOutDenominator = inPoolBefore * inWeight * 1000 + amountInWithFee * inWeight;
    uint256 expectedOut = expectedOutNumerator / expectedOutDenominator;

    swap(e, tokenIn, tokenOut, amountIn, minAmountOut);

    uint256 inPoolAfter = currentContract.pools[tokenIn].totalBalance;
    uint256 outPoolAfter = currentContract.pools[tokenOut].totalBalance;
    uint256 userInAfter = currentContract.pools[tokenIn].balances[e.msg.sender];
    uint256 userOutAfter = currentContract.pools[tokenOut].balances[e.msg.sender];

    assert expectedOut >= minAmountOut;
    assert inPoolAfter == inPoolBefore + amountIn;
    assert outPoolAfter == outPoolBefore - expectedOut;
    assert userInAfter == userInBefore + amountIn;
    assert userOutAfter == userOutBefore - expectedOut;
}
