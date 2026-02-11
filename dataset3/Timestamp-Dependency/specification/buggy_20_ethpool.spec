rule sendFundsToSwap_respects_limits(uint256 amount) {
    require msg.sender == swapsContract;
    require isActive == true;
    require amount >= minSwapAmount;
    require amount <= maxSwapAmount;
    sendFundsToSwap(amount);
    assert true, "sendFundsToSwap must succeed when within limits";
}

rule sendFundsToSwap_reverts_outside_limits(uint256 amount) {
    require msg.sender == swapsContract;
    require isActive == true;
    require amount < minSwapAmount || amount > maxSwapAmount;
    sendFundsToSwap(amount);
    assert_revert, "sendFundsToSwap must revert when outside limits";
}
