using Missing as missing;

methods {
    function IamMissing() external;
    function withdraw() external;
    function owner() external view returns (address);
}

rule constructor_is_only_callable_once(env e_init, env e_attack, address initial_owner, address non_owner) {
    require initial_owner != 0;
    require non_owner != 0;
    require non_owner != initial_owner;

    require e_init.msg.sender == initial_owner;
    missing.IamMissing(e_init);

    require e_attack.msg.sender == non_owner;
    missing.IamMissing(e_attack);

    assert missing.owner(e_attack) == non_owner;
}

rule owner_is_constant_after_init(env e, method f) {
    address owner_before = missing.owner(e);
    require owner_before != 0;

    calldata args;
    f(e, args);

    assert missing.owner(e) == owner_before;
}

rule withdraw_access_control(env e, address caller) {
    address current_owner = missing.owner(e);
    require caller != current_owner;
    require e.msg.sender == caller;

    missing.withdraw@withrevert(e);
}
