// Timestamp-Dependency specification for RampInstantEthPool (buggy_20.sol)

rule sendFundsToSwap_respects_limits(uint256 amount) {
    env e;
    require e.msg.sender == currentContract.swapsContract;
    require currentContract.isActive == true;
    require amount >= currentContract.minSwapAmount;
    require amount <= currentContract.maxSwapAmount;

    sendFundsToSwap(e, amount);

    assert true, "sendFundsToSwap must succeed when within limits";
}

rule sendFundsToSwap_reverts_outside_limits(uint256 amount) {
    env e;
    require e.msg.sender == currentContract.swapsContract;
    require currentContract.isActive == true;
    require amount < currentContract.minSwapAmount || amount > currentContract.maxSwapAmount;

    sendFundsToSwap@withrevert(e, amount);

    assert lastReverted, "sendFundsToSwap must revert when outside limits";
}
