rule cash_unchecked(uint roundIndex, uint subpotIndex) {
    cash(roundIndex, subpotIndex);
    assert true;
}
