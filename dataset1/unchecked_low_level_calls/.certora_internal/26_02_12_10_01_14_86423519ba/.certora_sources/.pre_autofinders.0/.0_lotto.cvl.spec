methods {
    function sendToWinner() external;
    function withdrawLeftOver() external;
}

/// @title sendToWinner must transfer winAmount and mark payedOut
rule sendToWinner_must_transfer(env e) {
    require currentContract.payedOut == false;

    uint256 balBefore = nativeBalances[currentContract];
    uint256 winAmt = currentContract.winAmount;

    sendToWinner(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - winAmt;
    assert currentContract.payedOut == true;
}

/// @title withdrawLeftOver must drain remaining balance
rule withdrawLeftOver_must_transfer(env e) {
    require currentContract.payedOut == true;

    withdrawLeftOver(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == 0;
}
