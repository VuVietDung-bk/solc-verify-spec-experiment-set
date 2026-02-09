rule getTokens_should_succeed(address addr, uint num) {
    getTokens(num, addr);
    assert false, "Low-level call in loop may fail silently";
}
