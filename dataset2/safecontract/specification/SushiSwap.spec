variables {
    mapping(address => Pool) pools;
}

rule depositMintsExpectedShares(address token, uint256 amount) {
    require amount > 0;
    require pools[token].totalBalance > 0;

    uint256 totalBalanceBefore = pools[token].totalBalance;
    uint256 totalSharesBefore = pools[token].totalShares;
    uint256 userBalanceBefore = pools[token].balances[msg.sender];

    uint256 expectedShares;
    if (totalSharesBefore == 0) {
        expectedShares = amount;
    } else {
        expectedShares = (amount * totalSharesBefore) / totalBalanceBefore;
    }

    deposit(token, amount);

    uint256 totalBalanceAfter = pools[token].totalBalance;
    uint256 totalSharesAfter = pools[token].totalShares;
    uint256 userBalanceAfter = pools[token].balances[msg.sender];

    assert totalBalanceAfter == totalBalanceBefore + amount;
    assert userBalanceAfter == userBalanceBefore + amount;
    assert totalSharesAfter == totalSharesBefore + expectedShares;
}

rule withdrawBurnsSharesForAmount(address token, uint256 shares) {
    require shares > 0;
    require pools[token].totalBalance > 0;
    require pools[token].totalShares > 0;

    uint256 totalBalanceBefore = pools[token].totalBalance;
    uint256 totalSharesBefore = pools[token].totalShares;
    uint256 userBalanceBefore = pools[token].balances[msg.sender];

    uint256 expectedAmount = (shares * totalBalanceBefore) / totalSharesBefore;

    withdraw(token, shares);

    uint256 totalBalanceAfter = pools[token].totalBalance;
    uint256 totalSharesAfter = pools[token].totalShares;
    uint256 userBalanceAfter = pools[token].balances[msg.sender];

    assert totalBalanceAfter == totalBalanceBefore - expectedAmount;
    assert userBalanceAfter == userBalanceBefore - expectedAmount;
    assert totalSharesAfter == totalSharesBefore - shares;
}
