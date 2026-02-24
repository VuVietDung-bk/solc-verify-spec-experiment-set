// Unhandled-Exceptions specification for Ownable (buggy_5.sol)

rule sendToWinner_unchk20_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk20 == false;
    sendToWinner_unchk20(e);
    assert currentContract.payedOut_unchk20, "payedOut flag is set even if send fails";
}

rule unhandledsend_unchk26_no_check(address callee) {
    env e;
    unhandledsend_unchk26(e, callee);
    assert true, "Function completes without checking send result";
}

rule withdrawLeftOver_unchk33_no_check() {
    env e;
    require currentContract.payedOut_unchk33 == true;
    withdrawLeftOver_unchk33(e);
    assert true, "Function completes without checking send result";
}

rule bug_unchk42_inverted_logic() {
    env e;
    bug_unchk42@withrevert(e);
    assert lastReverted, "Should revert due to inverted send check logic";
}
