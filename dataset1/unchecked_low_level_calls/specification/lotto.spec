variables
{
    bool payedOut;
    address winner;
    uint winAmount;
}

rule sendToWinner_must_transfer() {
    require payedOut == false;
    uint balBefore = contract.balance;
    sendToWinner();
    uint balAfter = contract.balance;
    assert balAfter == balBefore - winAmount;
    assert payedOut == true;
}

rule withdrawLeftOver_must_transfer() {
    require payedOut == true;
    uint balBefore = contract.balance;
    withdrawLeftOver();
    uint balAfter = contract.balance;
    assert balAfter == 0;
}
