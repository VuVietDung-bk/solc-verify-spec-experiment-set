variables {
    mapping(address => Pool) pools;
}

rule swapUpdatesPoolConsistently(address tokenIn, address tokenOut, uint256 amountIn, uint256 minAmountOut) {
    uint256 inPoolBefore = pools[tokenIn].totalBalance;
    uint256 outPoolBefore = pools[tokenOut].totalBalance;
    uint256 inWeight = pools[tokenIn].totalWeight;
    uint256 outWeight = pools[tokenOut].totalWeight;
    uint256 fee = pools[tokenIn].swapFee;
    uint256 userInBefore = pools[tokenIn].balances[msg.sender];
    uint256 userOutBefore = pools[tokenOut].balances[msg.sender];

    uint256 amountInWithFee = amountIn * (1000 - fee);
    uint256 expectedOutNumerator = amountInWithFee * outPoolBefore * outWeight;
    uint256 expectedOutDenominator = inPoolBefore * inWeight * 1000 + amountInWithFee * inWeight;
    uint256 expectedOut = expectedOutNumerator / expectedOutDenominator;

    swap(tokenIn, tokenOut, amountIn, minAmountOut);

    uint256 inPoolAfter = pools[tokenIn].totalBalance;
    uint256 outPoolAfter = pools[tokenOut].totalBalance;
    uint256 userInAfter = pools[tokenIn].balances[msg.sender];
    uint256 userOutAfter = pools[tokenOut].balances[msg.sender];

    assert expectedOut >= minAmountOut;
    assert inPoolAfter == inPoolBefore + amountIn;
    assert outPoolAfter == outPoolBefore - expectedOut;
    assert userInAfter == userInBefore + amountIn;
    assert userOutAfter == userOutBefore - expectedOut;
}
