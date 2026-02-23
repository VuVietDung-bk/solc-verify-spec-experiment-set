// Functions that call send() without checking return value
// These functions complete successfully even when transfer fails

rule cash_unchk34_ignores_send_failure(address winner) {
    cash_unchk34(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

rule cash_unchk10_ignores_send_failure(address winner) {
    cash_unchk10(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

rule cash_unchk22_ignores_send_failure(address winner) {
    cash_unchk22(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

rule cash_unchk46_ignores_send_failure(address winner) {
    cash_unchk46(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

rule bug_unchk7_ignores_send_failure() {
    bug_unchk7();
    // Bug: send() return value is not checked, will always revert due to 1==1
}

rule bug_unchk30_ignores_send_failure() {
    bug_unchk30();
    // Bug: send() return value checked but logic is inverted - reverts on success
}

rule my_func_unchk11_ignores_send_failure(address dst) {
    my_func_unchk11(dst);
    // Bug: send() return value is not checked
}

rule my_func_unchk23_ignores_send_failure(address dst) {
    my_func_unchk23(dst);
    // Bug: send() return value is not checked
}

rule my_func_unchk47_ignores_send_failure(address dst) {
    my_func_unchk47(dst);
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

rule withdrawLeftOver_unchk21_ignores_send_failure() {
    require payedOut_unchk21 == true;
    withdrawLeftOver_unchk21();
    // Bug: send() return value is not checked, funds may not be transferred
}

// Functions that call call() without checking return value

rule my_func_uncheck12_ignores_call_failure(address dst) {
    my_func_uncheck12(dst);
    // Bug: call() return value is not checked
}

// Functions with improper error handling

rule UncheckedExternalCall_unchk4_does_not_handle_failure() {
    UncheckedExternalCall_unchk4();
    // Bug: send() failure is checked but not properly handled (only comments)
}
