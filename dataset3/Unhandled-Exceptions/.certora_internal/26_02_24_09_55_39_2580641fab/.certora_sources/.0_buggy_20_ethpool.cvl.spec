methods {
    function cash_unchk46(uint, uint, address payable) external;
    function sendToWinner_unchk8() external;
    function sendToWinner_unchk32() external;
}

rule cash_unchk46_does_not_check_send_result(env e, address winner) {
    cash_unchk46@withrevert(e, 0, 0, winner);
    assert lastReverted,
        "cash_unchk46 should revert on send failure";
}

rule sendToWinner_unchk8_ignores_send_failure(env e) {
    bool payedOutBefore = payedOut_unchk8;
    require !payedOutBefore;
    
    sendToWinner_unchk8(e);
    
    bool payedOutAfter = payedOut_unchk8;
    assert payedOutAfter,
        "payedOut flag is set even if send fails";
}

rule sendToWinner_unchk32_ignores_send_failure(env e) {
    bool payedOutBefore = payedOut_unchk32;
    require !payedOutBefore;
    
    sendToWinner_unchk32(e);
    
    bool payedOutAfter = payedOut_unchk32;
    assert payedOutAfter,
        "payedOut flag is set even if send fails";
}
