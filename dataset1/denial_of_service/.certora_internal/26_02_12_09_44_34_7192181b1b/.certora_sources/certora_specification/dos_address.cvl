methods {
    function addCreditors() external;
    function emptyCreditors() external;
}

/// @title addCreditors adds exactly 350 entries from empty
rule add_increases_by_350(env e) {
    require currentContract.creditorAddresses.length == 0;

    addCreditors(e);

    assert currentContract.creditorAddresses.length == 350;
}

/// @title emptyCreditors resets array and sets win when list is large
rule empty_resets_when_large(env e) {
    require !currentContract.win;
    require currentContract.creditorAddresses.length > 1500;

    emptyCreditors(e);

    assert currentContract.creditorAddresses.length == 0;
    assert currentContract.win;
}
