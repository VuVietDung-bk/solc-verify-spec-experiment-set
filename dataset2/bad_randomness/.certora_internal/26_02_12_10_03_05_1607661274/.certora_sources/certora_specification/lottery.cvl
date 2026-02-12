methods {
    function makeBet() external;
}

/// @title Bet outcome depends on block.timestamp (bad randomness)
rule winShouldDependOnBetterEntropy(env e) {
    uint256 lenBefore = currentContract.bets.length;

    makeBet(e);

    uint256 lenAfter = currentContract.bets.length;
    bool expected = (e.block.timestamp % 2 == 0);

    assert lenAfter == lenBefore + 1;
    assert currentContract.bets[lenAfter - 1].won <=> expected;
}
