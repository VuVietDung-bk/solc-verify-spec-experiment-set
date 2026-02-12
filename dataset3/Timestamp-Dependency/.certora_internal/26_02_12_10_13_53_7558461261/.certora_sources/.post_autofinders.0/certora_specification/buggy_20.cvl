// Timestamp-Dependency specification for RampInstantEthPool (buggy_20.sol)

rule changeOwner_no_timestamp_dependency(address newOwner) {
    env e;
    require e.msg.sender == currentContract.owner;
    require newOwner != 0;

    changeOwner(e, newOwner);

    assert currentContract.owner == newOwner,
        "owner must change regardless of timestamp";
}

rule setIsActive_no_timestamp_dependency(bool newIsActive) {
    env e;
    require e.msg.sender == currentContract.owner;

    setIsActive(e, newIsActive);

    assert currentContract.isActive == newIsActive,
        "isActive must update regardless of timestamp";
}

rule withdrawAllFunds_no_timestamp_dependency(address to) {
    env e;
    require e.msg.sender == currentContract.owner;
    require to != 0;

    withdrawAllFunds(e, to);

    assert true, "withdrawAllFunds must succeed regardless of timestamp";
}

rule setLimits_no_timestamp_dependency(uint256 minAmount, uint256 maxAmount) {
    env e;
    require e.msg.sender == currentContract.owner;
    require minAmount <= maxAmount;
    require maxAmount <= 1461501637330902918203684832716283019655932542976;

    setLimits(e, minAmount, maxAmount);

    assert currentContract.minSwapAmount == minAmount,
        "minSwapAmount must update regardless of timestamp";
    assert currentContract.maxSwapAmount == maxAmount,
        "maxSwapAmount must update regardless of timestamp";
}

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
