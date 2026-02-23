rule bug_unchk3_ignores_send_failure(address addr) {
    bug_unchk3(addr);
    // Bug: send() return value is not checked
}

rule bug_unchk39_ignores_send_failure(address addr) {
    bug_unchk39(addr);
    // Bug: send() return value is not checked
}

rule bug_unchk42_ignores_send_failure() {
    bug_unchk42();
    // Bug: send() return value checked but logic is inverted - reverts on success
}

rule bug_unchk43_ignores_send_failure() {
    bug_unchk43();
    // Bug: send() return value is not checked, will always revert due to 1==1
}

rule my_func_unchk35_ignores_send_failure(address dst) {
    my_func_unchk35(dst);
    // Bug: send() return value is not checked
}

rule unhandledsend_unchk2_ignores_send_failure(address callee) {
    unhandledsend_unchk2(callee);
    // Bug: send() return value is not checked
}

rule withdrawLeftOver_unchk33_ignores_send_failure() {
    require payedOut_unchk33 == true;
    withdrawLeftOver_unchk33();
    // Bug: send() return value is not checked, funds may not be transferred
}

rule withdrawLeftOver_unchk45_ignores_send_failure() {
    require payedOut_unchk45 == true;
    withdrawLeftOver_unchk45();
    // Bug: send() return value is not checked, funds may not be transferred
}

rule withdrawBal_unchk17_ignores_send_failure() {
    withdrawBal_unchk17();
    // Bug: send() return value is not checked (sends 0 eth but still a bug)
}

rule withdrawBal_unchk41_ignores_send_failure() {
    withdrawBal_unchk41();
    // Bug: send() return value is not checked (sends 0 eth but still a bug)
}

rule my_func_uncheck36_ignores_call_failure(address dst) {
    my_func_uncheck36(dst);
    // Bug: call() return value is not checked
}

rule my_func_uncheck48_ignores_call_failure(address dst) {
    my_func_uncheck48(dst);
    // Bug: call() return value is not checked
}

rule callnotchecked_unchk1_ignores_call_failure(address callee) {
    callnotchecked_unchk1(callee);
    // Bug: call() return value is not checked
}

rule callnotchecked_unchk13_ignores_call_failure(address callee) {
    callnotchecked_unchk13(callee);
    // Bug: call() return value is not checked
}

rule callnotchecked_unchk37_ignores_call_failure(address callee) {
    callnotchecked_unchk37(callee);
    // Bug: call() return value is not checked
}

rule UncheckedExternalCall_unchk40_does_not_handle_failure() {
    UncheckedExternalCall_unchk40();
    // Bug: send() failure is checked but not properly handled (only comments)
}

// Critical bugs: State is updated even when payment fails
// These functions set payedOut flag to true regardless of send() result

rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk44_ignores_send_failure() {
    require payedOut_unchk44 == false;
    sendToWinner_unchk44();
    assert payedOut_unchk44,
        "payedOut flag is set even if send fails";
}
