// ========== State Corruption Bugs (sendToWinner patterns) ==========

// Bug: sendToWinner_unchk8 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8, "payedOut flag is set even if send fails";
}

// Bug: sendToWinner_unchk44 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk44_ignores_send_failure() {
    require payedOut_unchk44 == false;
    sendToWinner_unchk44();
    assert payedOut_unchk44, "payedOut flag is set even if send fails";
}

// Bug: bug_unchk39 ignores send return value
rule bug_unchk39_no_check(address addr) {
    bug_unchk39(addr);
    assert true, "Function completes without checking send result";
}

// Bug: my_func_unchk35 ignores send return value
rule my_func_unchk35_no_check(address dst) {
    my_func_unchk35(dst);
    assert true, "Function completes without checking send result";
}

// Bug: withdrawLeftOver_unchk9 requires payedOut but doesn't check send
rule withdrawLeftOver_unchk9_no_check() {
    require payedOut_unchk9 == true;
    withdrawLeftOver_unchk9();
    assert true, "Function completes without checking send result";
}

// ========== Unhandled Call Exceptions ==========

// Bug: callnotchecked_unchk13 uses call without checking return
rule callnotchecked_unchk13_no_check(address callee) {
    callnotchecked_unchk13(callee);
    assert true, "Function completes without checking call result";
}

// Bug: callnotchecked_unchk25 uses call without checking return
rule callnotchecked_unchk25_no_check(address callee) {
    callnotchecked_unchk25(callee);
    assert true, "Function completes without checking call result";
}

// Bug: my_func_uncheck36 uses low-level call without checking return
rule my_func_uncheck36_no_check(address dst) {
    my_func_uncheck36(dst);
    assert true, "Function completes without checking call result";
}

// Bug: UncheckedExternalCall_unchk40 checks send but does nothing in handlers
rule UncheckedExternalCall_unchk40_empty_handlers() {
    UncheckedExternalCall_unchk40();
    assert true, "Function has empty exception handlers";
}

// Bug: bug_unchk19 has faulty condition (always reverts due to || 1==1)
rule bug_unchk19_always_reverts() {
    bug_unchk19();
    assert_revert, "Always reverts due to || 1==1 condition";
}

// Bug: bug_unchk30 has inverted logic - reverts on success, continues on failure
rule bug_unchk30_inverted_logic() {
    bug_unchk30();
    assert_revert, "Should revert due to inverted send check logic";
}
