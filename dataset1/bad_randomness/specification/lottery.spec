variables {
    mapping(uint => Bet) bets;
}

rule winShouldDependOnBetterEntropy() {
    uint lenBefore = bets.length;

    makeBet();

    uint lenAfter = bets.length;
    bool expected = (block.timestamp % 2 == 0);

    assert lenAfter == lenBefore + 1;
    assert bets[lenAfter - 1].won <=> expected;
}
