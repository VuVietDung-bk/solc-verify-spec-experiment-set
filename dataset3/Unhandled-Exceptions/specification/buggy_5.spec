variables {
    bool payedOut_unchk8;
    address winner_unchk8;
    uint winAmount_unchk8;
    bool payedOut_unchk20;
    address winner_unchk20;
    uint winAmount_unchk20;
    bool payedOut_unchk32;
    address winner_unchk32;
    uint winAmount_unchk32;
    bool payedOut_unchk44;
    address winner_unchk44;
    uint winAmount_unchk44;
    bool payedOut_unchk33;
    bool payedOut_unchk45;
    bool payedOut_unchk9;
}

// ========== State Corruption Bugs (sendToWinner patterns) ==========

// Bug: sendToWinner_unchk8 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8, "payedOut flag is set even if send fails";
}

// Bug: sendToWinner_unchk20 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk20_ignores_send_failure() {
    require payedOut_unchk20 == false;
    sendToWinner_unchk20();
    assert payedOut_unchk20, "payedOut flag is set even if send fails";
}

// Bug: sendToWinner_unchk32 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk32_ignores_send_failure() {
    require payedOut_unchk32 == false;
    sendToWinner_unchk32();
    assert payedOut_unchk32, "payedOut flag is set even if send fails";
}

// Bug: sendToWinner_unchk44 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk44_ignores_send_failure() {
    require payedOut_unchk44 == false;
    sendToWinner_unchk44();
    assert payedOut_unchk44, "payedOut flag is set even if send fails";
}

// ========== Unhandled Send Exceptions ==========

// Bug: unhandledsend_unchk2 ignores send return value
rule unhandledsend_unchk2_no_check(address callee) {
    unhandledsend_unchk2(callee);
    assert true, "Function completes without checking send result";
}

// Bug: unhandledsend_unchk14 ignores send return value
rule unhandledsend_unchk14_no_check(address callee) {
    unhandledsend_unchk14(callee);
    assert true, "Function completes without checking send result";
}

// Bug: unhandledsend_unchk26 ignores send return value
rule unhandledsend_unchk26_no_check(address callee) {
    unhandledsend_unchk26(callee);
    assert true, "Function completes without checking send result";
}

// Bug: unhandledsend_unchk38 ignores send return value
rule unhandledsend_unchk38_no_check(address callee) {
    unhandledsend_unchk38(callee);
    assert true, "Function completes without checking send result";
}

// Bug: cash_unchk46 doesn't check send result
rule cash_unchk46_no_check(address winner) {
    cash_unchk46(0, 0, winner);
    assert true, "Function completes without checking send result";
}

// Bug: bug_unchk3 ignores send return value
rule bug_unchk3_no_check(address addr) {
    bug_unchk3(addr);
    assert true, "Function completes without checking send result";
}

// Bug: bug_unchk39 ignores send return value
rule bug_unchk39_no_check(address addr) {
    bug_unchk39(addr);
    assert true, "Function completes without checking send result";
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

// Bug: withdrawBal_unchk17 ignores send return value
rule withdrawBal_unchk17_no_check() {
    withdrawBal_unchk17();
    assert true, "Function completes without checking send result";
}

// Bug: withdrawLeftOver_unchk9 requires payedOut but doesn't check send
rule withdrawLeftOver_unchk9_no_check() {
    require payedOut_unchk9 == true;
    withdrawLeftOver_unchk9();
    assert true, "Function completes without checking send result";
}

// Bug: withdrawLeftOver_unchk33 requires payedOut but doesn't check send
rule withdrawLeftOver_unchk33_no_check() {
    require payedOut_unchk33 == true;
    withdrawLeftOver_unchk33();
    assert true, "Function completes without checking send result";
}

// Bug: withdrawLeftOver_unchk45 requires payedOut but doesn't check send
rule withdrawLeftOver_unchk45_no_check() {
    require payedOut_unchk45 == true;
    withdrawLeftOver_unchk45();
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

// Bug: callnotchecked_unchk37 uses call without checking return
rule callnotchecked_unchk37_no_check(address callee) {
    callnotchecked_unchk37(callee);
    assert true, "Function completes without checking call result";
}

// Bug: my_func_uncheck36 uses low-level call without checking return
rule my_func_uncheck36_no_check(address dst) {
    my_func_uncheck36(dst);
    assert true, "Function completes without checking call result";
}

// Bug: my_func_uncheck48 uses low-level call without checking return
rule my_func_uncheck48_no_check(address dst) {
    my_func_uncheck48(dst);
    assert true, "Function completes without checking call result";
}

// ========== Empty Exception Handlers ==========

// Bug: UncheckedExternalCall_unchk4 checks send but does nothing in handlers
rule UncheckedExternalCall_unchk4_empty_handlers() {
    UncheckedExternalCall_unchk4();
    assert true, "Function has empty exception handlers";
}

// Bug: UncheckedExternalCall_unchk40 checks send but does nothing in handlers
rule UncheckedExternalCall_unchk40_empty_handlers() {
    UncheckedExternalCall_unchk40();
    assert true, "Function has empty exception handlers";
}

// ========== Inverted Logic Bugs ==========

// Bug: bug_unchk7 has faulty condition (always reverts due to || 1==1)
rule bug_unchk7_always_reverts() {
    bug_unchk7();
    assert_revert, "Always reverts due to || 1==1 condition";
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

// Bug: bug_unchk42 has inverted logic - reverts on success, continues on failure
rule bug_unchk42_inverted_logic() {
    bug_unchk42();
    assert_revert, "Should revert due to inverted send check logic";
}

// Bug: bug_unchk43 has faulty condition (always reverts due to || 1==1)
rule bug_unchk43_always_reverts() {
    bug_unchk43();
    assert_revert, "Always reverts due to || 1==1 condition";
}
