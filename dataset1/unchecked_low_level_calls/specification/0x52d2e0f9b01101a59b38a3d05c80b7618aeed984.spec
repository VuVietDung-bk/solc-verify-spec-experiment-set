rule getTokens_unchecked(uint num, address addr) {
    getTokens(num, addr);
    assert true;
}
