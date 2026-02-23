// Functions that call send() without checking return value
// These functions complete successfully even when transfer fails

rule cash_unchk22_ignores_send_failure(address winner) {
    cash_unchk22(0, 0, winner);
    // Bug: send() return value is not checked, funds may not be transferred
}

rule bug_unchk31_ignores_send_failure() {
    bug_unchk31();
    // Bug: send() return value is not checked, will always revert due to 1==1
}

rule bug_unchk3_ignores_send_failure(address addr) {
    bug_unchk3(addr);
    // Bug: send() return value is not checked
}

rule withdrawLeftOver_unchk9_ignores_send_failure() {
    require payedOut_unchk9 == true;
    withdrawLeftOver_unchk9();
    // Bug: send() return value is not checked, funds may not be transferred
}
