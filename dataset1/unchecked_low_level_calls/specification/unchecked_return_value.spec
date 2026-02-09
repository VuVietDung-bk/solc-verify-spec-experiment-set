rule callnotchecked_should_revert_on_failure() {
    // Call back into this contract with empty calldata: no fallback, so the low-level call returns false.
    address callee;
    callnotchecked(callee);
    assert_revert;
}
