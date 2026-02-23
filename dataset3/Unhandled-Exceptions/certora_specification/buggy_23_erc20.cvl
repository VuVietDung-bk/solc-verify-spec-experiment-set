// Unhandled-Exceptions specification for ERC20 (buggy_23.sol)

// Unhandled-Exceptions specification for AGR (buggy_23.sol)

// Unhandled Call Exceptions

rule callnotchecked_unchk37_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk37(e, callee);
    assert true, "call() return value is not checked";
}

rule my_func_uncheck36_ignores_call_failure(address dst) {
    env e;
    my_func_uncheck36(e, dst);
    assert true, "call() return value is not checked";
}

// Unhandled Send Exceptions

rule bug_unchk3_ignores_send_failure(address addr) {
    env e;
    bug_unchk3(e, addr);
    assert true, "send() return value is not checked";
}

rule bug_unchk7_ignores_send_failure() {
    env e;
    bug_unchk7@withrevert(e);
    assert lastReverted, "will always revert due to 1==1";
}

rule bug_unchk30_ignores_send_failure() {
    env e;
    bug_unchk30@withrevert(e);
    assert lastReverted, "logic is inverted - reverts on success";
}

rule bug_unchk39_ignores_send_failure(address addr) {
    env e;
    bug_unchk39(e, addr);
    assert true, "send() return value is not checked";
}

rule my_func_unchk23_ignores_send_failure(address dst) {
    env e;
    my_func_unchk23(e, dst);
    assert true, "send() return value is not checked";
}

rule my_func_unchk35_ignores_send_failure(address dst) {
    env e;
    my_func_unchk35(e, dst);
    assert true, "send() return value is not checked";
}

rule unhandledsend_unchk14_ignores_send_failure(address callee) {
    env e;
    unhandledsend_unchk14(e, callee);
    assert true, "send() return value is not checked";
}

rule unhandledsend_unchk38_ignores_send_failure(address callee) {
    env e;
    unhandledsend_unchk38(e, callee);
    assert true, "send() return value is not checked";
}

rule withdrawLeftOver_unchk9_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk9 == true;
    withdrawLeftOver_unchk9(e);
    assert true, "send() return value is not checked";
}

// Empty Exception Handlers

rule UncheckedExternalCall_unchk4_does_not_handle_failure() {
    env e;
    UncheckedExternalCall_unchk4(e);
    assert true, "send() failure is checked but not properly handled";
}

rule cash_unchk46_ignores_send_failure(address winner) {
    env e;
    cash_unchk46(e, 0, 0, winner);
    assert true, "send() return value is not checked";
}

// State Corruption Bugs

rule sendToWinner_unchk8_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk8 == false;
    sendToWinner_unchk8(e);
    assert currentContract.payedOut_unchk8,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk20_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk20 == false;
    sendToWinner_unchk20(e);
    assert currentContract.payedOut_unchk20,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk32_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk32 == false;
    sendToWinner_unchk32(e);
    assert currentContract.payedOut_unchk32,
        "payedOut flag is set even if send fails";
}
