methods {
    function deposit(address, uint256) external;
    function withdraw(address, uint256) external;
}

/// @title deposit mints expected shares proportional to amount
rule depositMintsExpectedShares(env e, address token, uint256 amount) {
    require amount > 0;
    require currentContract.pools[token].totalBalance > 0;

    uint256 totalBalanceBefore = currentContract.pools[token].totalBalance;
    uint256 totalSharesBefore = currentContract.pools[token].totalShares;
    uint256 userBalanceBefore = currentContract.pools[token].balances[e.msg.sender];

    uint256 expectedShares;
    if (totalSharesBefore == 0) {
        expectedShares = amount;
    } else {
        expectedShares = (amount * totalSharesBefore) / totalBalanceBefore;
    }

    deposit(e, token, amount);

    uint256 totalBalanceAfter = currentContract.pools[token].totalBalance;
    uint256 totalSharesAfter = currentContract.pools[token].totalShares;
    uint256 userBalanceAfter = currentContract.pools[token].balances[e.msg.sender];

    assert totalBalanceAfter == totalBalanceBefore + amount;
    assert userBalanceAfter == userBalanceBefore + amount;
    assert totalSharesAfter == totalSharesBefore + expectedShares;
}

/// @title withdraw burns shares and returns correct amount
rule withdrawBurnsSharesForAmount(env e, address token, uint256 shares) {
    require shares > 0;
    require currentContract.pools[token].totalBalance > 0;
    require currentContract.pools[token].totalShares > 0;

    uint256 totalBalanceBefore = currentContract.pools[token].totalBalance;
    uint256 totalSharesBefore = currentContract.pools[token].totalShares;
    uint256 userBalanceBefore = currentContract.pools[token].balances[e.msg.sender];

    uint256 expectedAmount = (shares * totalBalanceBefore) / totalSharesBefore;

    withdraw(e, token, shares);

    uint256 totalBalanceAfter = currentContract.pools[token].totalBalance;
    uint256 totalSharesAfter = currentContract.pools[token].totalShares;
    uint256 userBalanceAfter = currentContract.pools[token].balances[e.msg.sender];

    assert totalBalanceAfter == totalBalanceBefore - expectedAmount;
    assert userBalanceAfter == userBalanceBefore - expectedAmount;
    assert totalSharesAfter == totalSharesBefore - shares;
}
