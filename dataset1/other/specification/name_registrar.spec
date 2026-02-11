rule register_should_revert_when_locked(bytes32 name, address mapped) {
    require unlocked == false;
    register(name, mapped);
    assert_revert;
}
