// Functions that call send()/call() without checking return value
// These functions complete successfully even when transfer fails

rule callnotchecked_unchk37_ignores_call_failure(address callee) {
    callnotchecked_unchk37(callee);
    // Bug: call() return value is not checked
}

rule my_func_uncheck36_ignores_call_failure(address dst) {
    my_func_uncheck36(dst);
    // Bug: call() return value is not checked
}

rule bug_unchk3_ignores_send_failure(address addr) {
    bug_unchk3(addr);
    // Bug: send() return value is not checked
}

rule bug_unchk7_ignores_send_failure() {
    bug_unchk7();
    // Bug: send() return value is not checked, will always revert due to 1==1
}

rule bug_unchk30_ignores_send_failure() {
    bug_unchk30();
    // Bug: send() return value checked but logic is inverted - reverts on success
}

rule bug_unchk39_ignores_send_failure(address addr) {
    bug_unchk39(addr);
    // Bug: send() return value is not checked
}

rule my_func_unchk23_ignores_send_failure(address dst) {
    my_func_unchk23(dst);
    // Bug: send() return value is not checked
}

rule my_func_unchk35_ignores_send_failure(address dst) {
    my_func_unchk35(dst);
    // Bug: send() return value is not checked
}

rule unhandledsend_unchk14_ignores_send_failure(address callee) {
    unhandledsend_unchk14(callee);
    // Bug: send() return value is not checked
}

rule unhandledsend_unchk38_ignores_send_failure(address callee) {
    unhandledsend_unchk38(callee);
    // Bug: send() return value is not checked
}

rule withdrawLeftOver_unchk9_ignores_send_failure() {
    require payedOut_unchk9 == true;
    withdrawLeftOver_unchk9();
    // Bug: send() return value is not checked, funds may not be transferred
}

rule UncheckedExternalCall_unchk4_does_not_handle_failure() {
    UncheckedExternalCall_unchk4();
    // Bug: send() failure is checked but not properly handled (only comments)
}

rule cash_unchk46_ignores_send_failure(address winner) {
    cash_unchk46(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

// Critical bugs: State is updated even when payment fails
// These functions set payedOut flag to true regardless of send() result

rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk20_ignores_send_failure() {
    require payedOut_unchk20 == false;
    sendToWinner_unchk20();
    assert payedOut_unchk20,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk32_ignores_send_failure() {
    require payedOut_unchk32 == false;
    sendToWinner_unchk32();
    assert payedOut_unchk32,
        "payedOut flag is set even if send fails";
}
