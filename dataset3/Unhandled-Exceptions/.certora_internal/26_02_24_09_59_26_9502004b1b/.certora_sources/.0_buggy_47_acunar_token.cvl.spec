// Unhandled-Exceptions specification for AcunarToken (buggy_47.sol)

// Unhandled-Exceptions specification for AcunarIEO (buggy_47.sol)

// Unhandled Send Exceptions

rule cash_unchk34_ignores_send_failure(address winner) {
    env e;
    cash_unchk34(e, 0, 0, winner);
    assert true, "send() return value is not checked";
}

rule cash_unchk10_ignores_send_failure(address winner) {
    env e;
    cash_unchk10(e, 0, 0, winner);
    assert true, "send() return value is not checked";
}

rule cash_unchk22_ignores_send_failure(address winner) {
    env e;
    cash_unchk22(e, 0, 0, winner);
    assert true, "send() return value is not checked";
}

rule cash_unchk46_ignores_send_failure(address winner) {
    env e;
    cash_unchk46(e, 0, 0, winner);
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

rule my_func_unchk11_ignores_send_failure(address dst) {
    env e;
    my_func_unchk11(e, dst);
    assert true, "send() return value is not checked";
}

rule my_func_unchk23_ignores_send_failure(address dst) {
    env e;
    my_func_unchk23(e, dst);
    assert true, "send() return value is not checked";
}

rule my_func_unchk47_ignores_send_failure(address dst) {
    env e;
    my_func_unchk47(e, dst);
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

rule withdrawLeftOver_unchk21_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk21 == true;
    withdrawLeftOver_unchk21(e);
    assert true, "send() return value is not checked";
}

// Unhandled Call Exceptions

rule my_func_uncheck12_ignores_call_failure(address dst) {
    env e;
    my_func_uncheck12(e, dst);
    assert true, "call() return value is not checked";
}

// Empty Exception Handlers

rule UncheckedExternalCall_unchk4_does_not_handle_failure() {
    env e;
    UncheckedExternalCall_unchk4(e);
    assert true, "send() failure is checked but not properly handled";
}
