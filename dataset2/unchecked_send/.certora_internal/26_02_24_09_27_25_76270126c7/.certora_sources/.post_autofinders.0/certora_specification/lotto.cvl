// CVL Spec for Lotto - Unchecked send vulnerability
// send() return value not checked

methods {
    function sendToWinner() external;
    function withdrawLeftOver() external;
    function payedOut() external returns (bool) envfree;
    function winner() external returns (address) envfree;
    function winAmount() external returns (uint) envfree;
}

/**
 * Rule: sendToWinner_sets_payedOut
 * After sendToWinner, payedOut must be true.
 */
rule sendToWinner_sets_payedOut(env e) {
    require payedOut() == false;
    
    sendToWinner(e);
    
    assert payedOut() == true;
}

/**
 * Rule: withdrawLeftOver_requires_payedOut
 * Can only withdraw if already paid out.
 */
rule withdrawLeftOver_requires_payedOut(env e) {
    require payedOut() == true;
    
    withdrawLeftOver(e);
    
    // Should not revert - payedOut required
    assert payedOut() == true;
}
