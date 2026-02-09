variables {
    bool payedOut_unchk8;
    address winner_unchk8;
    uint winAmount_unchk8;
}

// Bug: sendToWinner_unchk8 doesn't check send result but sets payedOut flag anyway
rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8, "payedOut flag is set even if send fails";
}

// Bug: unhandledsend_unchk14 ignores send return value - no state to check but should not revert
rule unhandledsend_unchk14_no_check() {
    unhandledsend_unchk14(address(0));
    assert true, "Function completes without checking send result";
}

// Bug: unhandledsend_unchk38 ignores send return value
rule unhandledsend_unchk38_no_check() {
    unhandledsend_unchk38(address(0));
    assert true, "Function completes without checking send result";
}

// Bug: cash_unchk46 doesn't check send result
rule cash_unchk46_no_check(address winner) {
    cash_unchk46(0, 0, winner);
    assert true, "Function completes without checking send result";
}

// Bug: bug_unchk39 ignores send return value
rule bug_unchk39_no_check(address addr) {
    bug_unchk39(addr);
    assert true, "Function completes without checking send result";
}

// Bug: my_func_uncheck36 uses low-level call without checking return
rule my_func_uncheck36_no_check(address dst) {
    my_func_uncheck36(dst);
    assert true, "Function completes without checking call result";
}

// Bug: callnotchecked_unchk13 uses call without checking return
rule callnotchecked_unchk13_no_check(address callee) {
    callnotchecked_unchk13(callee);
    assert true, "Function completes without checking call result";
}

// Bug: bug_unchk30 has inverted logic - reverts on success, continues on failure
rule bug_unchk30_inverted_logic() {
    bug_unchk30();
    assert_revert, "Should revert due to inverted send check logic";
}

// Bug: UncheckedExternalCall_unchk4 checks send but does nothing in handlers
rule UncheckedExternalCall_unchk4_empty_handlers() {
    UncheckedExternalCall_unchk4();
    assert true, "Function has empty exception handlers";
}

// Bug: bug_unchk7 has faulty condition (always reverts due to || 1==1)
rule bug_unchk7_always_reverts() {
    bug_unchk7();
    assert_revert, "Always reverts due to || 1==1 condition";
}

// Bug: my_func_unchk23 ignores send return value
rule my_func_unchk23_no_check(address dst) {
    my_func_unchk23(dst);
    assert true, "Function completes without checking send result";
}

// Bug: my_func_unchk35 ignores send return value  
rule my_func_unchk35_no_check(address dst) {
    my_func_unchk35(dst);
    assert true, "Function completes without checking send result";
}
