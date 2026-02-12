methods {
    function register(bytes32, address) external;
}

/// @title register must revert when contract is locked
rule register_should_revert_when_locked(env e, bytes32 name, address mapped) {
    require currentContract.unlocked == false;

    register@withrevert(e, name, mapped);

    assert lastReverted;
}
