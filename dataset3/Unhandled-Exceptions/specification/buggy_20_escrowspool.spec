variables {
    bool payedOut_unchk20;
    address winner_unchk20;
    uint winAmount_unchk20;
}

rule sendToWinner_unchk20_ignores_send_failure() {
    require payedOut_unchk20 == false;
    sendToWinner_unchk20();
    assert payedOut_unchk20,
        "payedOut flag is set even if send fails";
}
