methods {
    function sendToWinner_unchk20() external;
}

rule sendToWinner_unchk20_ignores_send_failure(env e) {
    bool payedOutBefore = payedOut_unchk20;
    require !payedOutBefore;
    
    sendToWinner_unchk20(e);
    
    bool payedOutAfter = payedOut_unchk20;
    assert payedOutAfter,
        "payedOut flag is set even if send fails";
}
