rule fallback_delegatecall() {
    fallback();
    assert true;
}

rule getOwner_delegatecall(uint ownerIndex) {
    getOwner(ownerIndex);
    assert true;
}

rule hasConfirmed_delegatecall(bytes32 op, address owner) {
    hasConfirmed(op, owner);
    assert true;
}

rule isOwner_delegatecall(address addr) {
    isOwner(addr);
    assert true;
}
