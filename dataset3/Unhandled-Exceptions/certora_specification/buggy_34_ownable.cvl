// Unhandled-Exceptions specification for Ownable (buggy_34.sol)

// Unhandled-Exceptions specification for LollypopToken (buggy_34.sol)

// Unhandled Send Exceptions

rule cash_unchk22_ignores_send_failure(address winner) {
    env e;
    cash_unchk22(e, 0, 0, winner);
    assert true, "send() return value is not checked";
}

rule bug_unchk31_ignores_send_failure() {
    env e;
    bug_unchk31@withrevert(e);
    assert lastReverted, "will always revert due to 1==1";
}

rule bug_unchk3_ignores_send_failure(address addr) {
    env e;
    bug_unchk3(e, addr);
    assert true, "send() return value is not checked";
}

rule withdrawLeftOver_unchk9_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk9 == true;
    withdrawLeftOver_unchk9(e);
    assert true, "send() return value is not checked";
}
