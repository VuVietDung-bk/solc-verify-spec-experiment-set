// Bug: sendToWinner_unchk20 doesn't check send result but sets payedOut flag
rule sendToWinner_unchk20_ignores_send_failure() {
    require payedOut_unchk20 == false;
    sendToWinner_unchk20();
    assert payedOut_unchk20, "payedOut flag is set even if send fails";
}

// Bug: unhandledsend_unchk26 ignores send return value
rule unhandledsend_unchk26_no_check(address callee) {
    unhandledsend_unchk26(callee);
    assert true, "Function completes without checking send result";
}

// Bug: withdrawLeftOver_unchk33 requires payedOut but doesn't check send
rule withdrawLeftOver_unchk33_no_check() {
    require payedOut_unchk33 == true;
    withdrawLeftOver_unchk33();
    assert true, "Function completes without checking send result";
}

// Bug: bug_unchk42 has inverted logic - reverts on success, continues on failure
rule bug_unchk42_inverted_logic() {
    bug_unchk42();
    assert_revert, "Should revert due to inverted send check logic";
}
