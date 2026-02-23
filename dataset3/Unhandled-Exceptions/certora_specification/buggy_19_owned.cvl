// Unhandled-Exceptions specification for owned (buggy_19.sol)

rule withdrawBal_unchk17_no_check() {
    env e;
    withdrawBal_unchk17(e);
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
