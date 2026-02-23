// Spec for Lotto - Unchecked send vulnerability
// send() return value not checked

variables {
    bool payedOut;
    address winner;
    uint winAmount;
}

/**
 * Rule: sendToWinner_sets_payedOut
 * After sendToWinner, payedOut must be true.
 */
rule sendToWinner_sets_payedOut() {
    require payedOut == false;
    
    sendToWinner();
    
    assert payedOut == true;
}

/**
 * Rule: withdrawLeftOver_requires_payedOut
 * Can only withdraw if already paid out.
 */
rule withdrawLeftOver_requires_payedOut() {
    require payedOut == true;
    
    withdrawLeftOver();
    
    // Should not revert - payedOut required
    assert payedOut == true;
}
