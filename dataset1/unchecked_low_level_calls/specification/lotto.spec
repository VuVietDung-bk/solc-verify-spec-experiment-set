variables
{
    bool payedOut;
    address winner;
    uint winAmount;
}

rule sendToWinner_marks_payedOut() {
    require payedOut == false;
    sendToWinner();
    assert payedOut == true;
}

rule withdrawLeftOver_after_payout() {
    require payedOut == true;
    withdrawLeftOver();
    assert true;
}
