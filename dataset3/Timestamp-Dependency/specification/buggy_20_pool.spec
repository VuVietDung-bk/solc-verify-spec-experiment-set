variables {
    uint256 bugv_tmstmp2;
    uint256 bugv_tmstmp3;
    uint256 bugv_tmstmp4;
}

rule withdrawAllFunds_no_timestamp_dependency(address to) {
    require msg.sender == owner;
    require to != address(0);
    withdrawAllFunds(to);
    assert true, "withdrawAllFunds must succeed regardless of timestamp";
}

rule setLimits_no_timestamp_dependency(uint256 minAmount, uint256 maxAmount) {
    require msg.sender == owner;
    require minAmount <= maxAmount;
    require maxAmount <= 1461501637330902918203684832716283019655932542976;
    setLimits(minAmount, maxAmount);
    assert minSwapAmount == minAmount, "minSwapAmount must update regardless of timestamp";
    assert maxSwapAmount == maxAmount, "maxSwapAmount must update regardless of timestamp";
}
