using Missing as missing;

methods {
    function IamMissing() external;
    function withdraw() external;
}

rule constructor_is_only_callable_once(env e, address initial_owner, address non_owner) {
    require initial_owner != 0;
    require non_owner != 0;
    require non_owner != initial_owner;

    e.msg.sender = initial_owner;
    missing.IamMissing(e);

    e.msg.sender = non_owner;
    missing.IamMissing(e);

    assert missing.owner() == non_owner;
}

rule owner_is_constant_after_init(env e, method f) {
    address owner_before = missing.owner();
    require owner_before != 0;

    calldata args;
    f(e, args);

    assert missing.owner() == owner_before;
}

rule withdraw_access_control(env e, address caller) {
    address current_owner = missing.owner();
    require caller != current_owner;

    e.msg.sender = caller;
    missing.withdraw@withrevert(e);
}
