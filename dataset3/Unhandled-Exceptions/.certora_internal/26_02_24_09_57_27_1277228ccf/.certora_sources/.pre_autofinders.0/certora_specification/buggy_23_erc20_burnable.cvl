// Unhandled-Exceptions specification for ERC20Burnable (buggy_23.sol)

rule callnotchecked_unchk25_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk25(e, callee);
    assert true, "call() return value is not checked";
}

rule bug_unchk19_ignores_send_failure() {
    env e;
    bug_unchk19@withrevert(e);
    assert lastReverted, "will always revert due to 1==1";
}

rule unhandledsend_unchk26_ignores_send_failure(address callee) {
    env e;
    unhandledsend_unchk26(e, callee);
    assert true, "send() return value is not checked";
}

rule withdrawLeftOver_unchk33_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk33 == true;
    withdrawLeftOver_unchk33(e);
    assert true, "send() return value is not checked";
}

rule UncheckedExternalCall_unchk40_does_not_handle_failure() {
    env e;
    UncheckedExternalCall_unchk40(e);
    assert true, "send() failure is checked but not properly handled";
}

rule sendToWinner_unchk44_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk44 == false;
    sendToWinner_unchk44(e);
    assert currentContract.payedOut_unchk44,
        "payedOut flag is set even if send fails";
}
