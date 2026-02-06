rule withdraw_delegatecall() {
    withdraw();
    assert true;
}

rule fallback_delegatecall() {
    fallback();
    assert true;
}
