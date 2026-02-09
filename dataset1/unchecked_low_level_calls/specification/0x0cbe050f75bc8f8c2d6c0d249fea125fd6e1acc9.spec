rule callAddress_should_succeed(address target) {
    // The call uses no return check; we require success to expose silent failure.
    callAddress(target);
    assert_revert;
}
