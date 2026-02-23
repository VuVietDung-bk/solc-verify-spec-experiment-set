// Bug: withdrawBal_unchk17 ignores send return value
rule withdrawBal_unchk17_no_check() {
    withdrawBal_unchk17();
    assert true, "Function completes without checking send result";
}

// Bug: callnotchecked_unchk37 uses call without checking return
rule callnotchecked_unchk37_no_check(address callee) {
    callnotchecked_unchk37(callee);
    assert true, "Function completes without checking call result";
}

// Bug: my_func_uncheck48 uses low-level call without checking return
rule my_func_uncheck48_no_check(address dst) {
    my_func_uncheck48(dst);
    assert true, "Function completes without checking call result";
}
