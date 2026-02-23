variables {
    bool payedOut_unchk8;
    address winner_unchk8;
    uint winAmount_unchk8;
    bool payedOut_unchk32;
    address winner_unchk32;
    uint winAmount_unchk32;
}

rule cash_unchk46_does_not_check_send_result(address winner) {
    cash_unchk46(0, 0, winner);
    assert_revert;
}

rule sendToWinner_unchk8_ignores_send_failure() {
    require payedOut_unchk8 == false;
    sendToWinner_unchk8();
    assert payedOut_unchk8,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk32_ignores_send_failure() {
    require payedOut_unchk32 == false;
    sendToWinner_unchk32();
    assert payedOut_unchk32,
        "payedOut flag is set even if send fails";
}
