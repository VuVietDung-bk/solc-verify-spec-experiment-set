rule callnotchecked_unchk25_ignores_call_failure(address callee) {
    callnotchecked_unchk25(callee);
    // Bug: call() return value is not checked
}

rule bug_unchk19_ignores_send_failure() {
    bug_unchk19();
    // Bug: send() return value is not checked, will always revert due to 1==1
}

rule unhandledsend_unchk26_ignores_send_failure(address callee) {
    unhandledsend_unchk26(callee);
    // Bug: send() return value is not checked
}

rule withdrawLeftOver_unchk33_ignores_send_failure() {
    require payedOut_unchk33 == true;
    withdrawLeftOver_unchk33();
    // Bug: send() return value is not checked, funds may not be transferred
}

rule UncheckedExternalCall_unchk40_does_not_handle_failure() {
    UncheckedExternalCall_unchk40();
    // Bug: send() failure is checked but not properly handled (only comments)
}

rule sendToWinner_unchk44_ignores_send_failure() {
    require payedOut_unchk44 == false;
    sendToWinner_unchk44();
    assert payedOut_unchk44,
        "payedOut flag is set even if send fails";
}
