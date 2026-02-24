// Unhandled-Exceptions specification for AcunarIEO (buggy_47.sol)

rule bug_unchk3_ignores_send_failure(address addr) {
    env e;
    bug_unchk3(e, addr);
    assert true, "send() return value is not checked";
}

rule bug_unchk39_ignores_send_failure(address addr) {
    env e;
    bug_unchk39(e, addr);
    assert true, "send() return value is not checked";
}

rule bug_unchk42_ignores_send_failure() {
    env e;
    bug_unchk42@withrevert(e);
    assert lastReverted, "logic is inverted - reverts on success";
}

rule bug_unchk43_ignores_send_failure() {
    env e;
    bug_unchk43@withrevert(e);
    assert lastReverted, "will always revert due to 1==1";
}

rule my_func_unchk35_ignores_send_failure(address dst) {
    env e;
    my_func_unchk35(e, dst);
    assert true, "send() return value is not checked";
}

rule unhandledsend_unchk2_ignores_send_failure(address callee) {
    env e;
    unhandledsend_unchk2(e, callee);
    assert true, "send() return value is not checked";
}

rule withdrawLeftOver_unchk33_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk33 == true;
    withdrawLeftOver_unchk33(e);
    assert true, "send() return value is not checked";
}

rule withdrawLeftOver_unchk45_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk45 == true;
    withdrawLeftOver_unchk45(e);
    assert true, "send() return value is not checked";
}

rule withdrawBal_unchk17_ignores_send_failure() {
    env e;
    withdrawBal_unchk17(e);
    assert true, "send() return value is not checked";
}

rule withdrawBal_unchk41_ignores_send_failure() {
    env e;
    withdrawBal_unchk41(e);
    assert true, "send() return value is not checked";
}

rule my_func_uncheck36_ignores_call_failure(address dst) {
    env e;
    my_func_uncheck36(e, dst);
    assert true, "call() return value is not checked";
}

rule my_func_uncheck48_ignores_call_failure(address dst) {
    env e;
    my_func_uncheck48(e, dst);
    assert true, "call() return value is not checked";
}

rule callnotchecked_unchk1_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk1(e, callee);
    assert true, "call() return value is not checked";
}

rule callnotchecked_unchk13_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk13(e, callee);
    assert true, "call() return value is not checked";
}

rule callnotchecked_unchk37_ignores_call_failure(address callee) {
    env e;
    callnotchecked_unchk37(e, callee);
    assert true, "call() return value is not checked";
}

rule UncheckedExternalCall_unchk40_does_not_handle_failure() {
    env e;
    UncheckedExternalCall_unchk40(e);
    assert true, "send() failure is checked but not properly handled";
}

// State Corruption Bugs

rule sendToWinner_unchk8_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk8 == false;
    sendToWinner_unchk8(e);
    assert currentContract.payedOut_unchk8, "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk44_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk44 == false;
    sendToWinner_unchk44(e);
    assert currentContract.payedOut_unchk44, "payedOut flag is set even if send fails";
}
