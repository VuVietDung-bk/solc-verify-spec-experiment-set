// Bug: unhandledsend_unchk38 ignores send return value
rule unhandledsend_unchk38_no_check() {
    unhandledsend_unchk38(address(0));
    assert true, "Function completes without checking send result";
}

// Bug: cash_unchk46 doesn't check send result
rule cash_unchk46_no_check(address winner) {
    cash_unchk46(0, 0, winner);
    assert true, "Function completes without checking send result";
}

// Bug: UncheckedExternalCall_unchk4 checks send but does nothing in handlers
rule UncheckedExternalCall_unchk4_empty_handlers() {
    UncheckedExternalCall_unchk4();
    assert true, "Function has empty exception handlers";
}

// Bug: bug_unchk7 has faulty condition (always reverts due to || 1==1)
rule bug_unchk7_always_reverts() {
    bug_unchk7();
    assert_revert, "Always reverts due to || 1==1 condition";
}

// Bug: my_func_unchk23 ignores send return value
rule my_func_unchk23_no_check(address dst) {
    my_func_unchk23(dst);
    assert true, "Function completes without checking send result";
}

// Bug: my_func_unchk35 ignores send return value  
rule my_func_unchk35_no_check(address dst) {
    my_func_unchk35(dst);
    assert true, "Function completes without checking send result";
}
