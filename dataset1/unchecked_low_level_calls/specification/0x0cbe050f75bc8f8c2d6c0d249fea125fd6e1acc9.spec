rule callAddress_unchecked(address target) {
    callAddress(target);
    assert true;
}
