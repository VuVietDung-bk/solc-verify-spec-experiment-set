methods {
    function IamMissing() external;
    function withdraw() external;
}

/// @title Anyone can seize ownership via IamMissing
rule constructor_is_only_callable_once(env e, address non_owner) {
    require currentContract.owner != 0;
    require non_owner != currentContract.owner;
    require non_owner != 0;
    require e.msg.sender == non_owner;

    IamMissing(e);

    assert currentContract.owner == non_owner,
        "Vulnerability: anyone can seize owner via IamMissing";
}

/// @title Owner must not change after initialization
rule owner_is_constant_after_init(env e, method f) {
    address owner_before = currentContract.owner;
    require owner_before != 0;

    calldataarg args;
    f(e, args);

    assert currentContract.owner == owner_before,
        "Vulnerability: owner changed unexpectedly";
}

/// @title Only owner can call withdraw
rule withdraw_access_control(env e) {
    require e.msg.sender != currentContract.owner;

    withdraw@withrevert(e);

    assert lastReverted,
        "Vulnerability: non-owner can call withdraw";
}
