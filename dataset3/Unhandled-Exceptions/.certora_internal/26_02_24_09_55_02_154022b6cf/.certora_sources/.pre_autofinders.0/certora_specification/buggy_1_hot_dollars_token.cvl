// Unhandled-Exceptions specification for HotDollarsToken (buggy_1.sol)

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

rule UncheckedExternalCall_unchk4_empty_handlers() {
    env e;
    UncheckedExternalCall_unchk4(e);
    assert true, "Function has empty exception handlers";
}

rule bug_unchk7_always_reverts() {
    env e;
    bug_unchk7@withrevert(e);
    assert lastReverted, "Always reverts due to || 1==1 condition";
}

rule my_func_unchk23_no_check(address dst) {
    env e;
    my_func_unchk23(e, dst);
    assert true, "Function completes without checking send result";
}

rule my_func_unchk35_no_check(address dst) {
    env e;
    my_func_unchk35(e, dst);
    assert true, "Function completes without checking send result";
}
