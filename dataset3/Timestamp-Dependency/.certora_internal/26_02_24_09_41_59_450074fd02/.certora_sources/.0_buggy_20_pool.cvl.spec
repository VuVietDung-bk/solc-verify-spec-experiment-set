// Timestamp-Dependency specification for Stoppable (buggy_20.sol) - pool management

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
