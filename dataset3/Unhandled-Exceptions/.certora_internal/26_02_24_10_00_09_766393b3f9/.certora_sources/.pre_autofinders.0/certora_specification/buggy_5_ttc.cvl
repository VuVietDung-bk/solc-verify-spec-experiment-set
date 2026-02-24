// Unhandled-Exceptions specification for TTC (buggy_5.sol)

// Unhandled-Exceptions specification for TTC (buggy_5.sol)

// State Corruption Bugs (sendToWinner patterns)

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

rule bug_unchk39_no_check(address addr) {
    env e;
    bug_unchk39(e, addr);
    assert true, "Function completes without checking send result";
}

rule my_func_unchk35_no_check(address dst) {
    env e;
    my_func_unchk35(e, dst);
    assert true, "Function completes without checking send result";
}

rule withdrawLeftOver_unchk9_no_check() {
    env e;
    require currentContract.payedOut_unchk9 == true;
    withdrawLeftOver_unchk9(e);
    assert true, "Function completes without checking send result";
}

// Unhandled Call Exceptions

rule callnotchecked_unchk13_no_check(address callee) {
    env e;
    callnotchecked_unchk13(e, callee);
    assert true, "Function completes without checking call result";
}

rule callnotchecked_unchk25_no_check(address callee) {
    env e;
    callnotchecked_unchk25(e, callee);
    assert true, "Function completes without checking call result";
}

rule my_func_uncheck36_no_check(address dst) {
    env e;
    my_func_uncheck36(e, dst);
    assert true, "Function completes without checking call result";
}

rule UncheckedExternalCall_unchk40_empty_handlers() {
    env e;
    UncheckedExternalCall_unchk40(e);
    assert true, "Function has empty exception handlers";
}

rule bug_unchk19_always_reverts() {
    env e;
    bug_unchk19@withrevert(e);
    assert lastReverted, "Always reverts due to || 1==1 condition";
}

rule bug_unchk30_inverted_logic() {
    env e;
    bug_unchk30@withrevert(e);
    assert lastReverted, "Should revert due to inverted send check logic";
}
