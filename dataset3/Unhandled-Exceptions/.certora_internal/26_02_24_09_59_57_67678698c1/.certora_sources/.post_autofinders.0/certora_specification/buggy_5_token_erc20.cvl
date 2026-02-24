// Unhandled-Exceptions specification for TokenERC20 (buggy_5.sol)

rule sendToWinner_unchk32_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk32 == false;
    sendToWinner_unchk32(e);
    assert currentContract.payedOut_unchk32, "payedOut flag is set even if send fails";
}

// Unhandled Send Exceptions

rule unhandledsend_unchk2_no_check(address callee) {
    env e;
    unhandledsend_unchk2(e, callee);
    assert true, "Function completes without checking send result";
}

rule unhandledsend_unchk14_no_check(address callee) {
    env e;
    unhandledsend_unchk14(e, callee);
    assert true, "Function completes without checking send result";
}

rule unhandledsend_unchk38_no_check(address callee) {
    env e;
    unhandledsend_unchk38(e, callee);
    assert true, "Function completes without checking send result";
}

rule cash_unchk46_no_check(address winner) {
    env e;
    cash_unchk46(e, 0, 0, winner);
    assert true, "Function completes without checking send result";
}

rule bug_unchk3_no_check(address addr) {
    env e;
    bug_unchk3(e, addr);
    assert true, "Function completes without checking send result";
}

rule my_func_unchk23_no_check(address dst) {
    env e;
    my_func_unchk23(e, dst);
    assert true, "Function completes without checking send result";
}

rule withdrawBal_unchk17_no_check() {
    env e;
    withdrawBal_unchk17(e);
    assert true, "Function completes without checking send result";
}

rule withdrawLeftOver_unchk45_no_check() {
    env e;
    require currentContract.payedOut_unchk45 == true;
    withdrawLeftOver_unchk45(e);
    assert true, "Function completes without checking send result";
}

rule callnotchecked_unchk37_no_check(address callee) {
    env e;
    callnotchecked_unchk37(e, callee);
    assert true, "Function completes without checking call result";
}

rule my_func_uncheck48_no_check(address dst) {
    env e;
    my_func_uncheck48(e, dst);
    assert true, "Function completes without checking call result";
}

// Empty Exception Handlers

rule UncheckedExternalCall_unchk4_empty_handlers() {
    env e;
    UncheckedExternalCall_unchk4(e);
    assert true, "Function has empty exception handlers";
}

// Inverted Logic Bugs

rule bug_unchk7_always_reverts() {
    env e;
    bug_unchk7@withrevert(e);
    assert lastReverted, "Always reverts due to || 1==1 condition";
}

rule bug_unchk43_always_reverts() {
    env e;
    bug_unchk43@withrevert(e);
    assert lastReverted, "Always reverts due to || 1==1 condition";
}
