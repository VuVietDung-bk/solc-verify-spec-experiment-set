variables
{
    address[] creditorAddresses;
    bool win;
}

rule add_increases_by_350() {
    require creditorAddresses.length == 0;
    addCreditors();
    assert creditorAddresses.length == 350;
}

rule empty_resets_when_large() {
    require creditorAddresses.length > 1500;
    emptyCreditors();
    assert creditorAddresses.length == 0;
    assert win == true;
}
