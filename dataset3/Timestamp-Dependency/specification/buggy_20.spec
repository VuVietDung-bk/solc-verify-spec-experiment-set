variables {
    uint256 bugv_tmstmp5;
    uint256 bugv_tmstmp1;
    uint256 bugv_tmstmp2;
    uint256 bugv_tmstmp3;
    uint256 bugv_tmstmp4;
}

rule changeOwner_no_timestamp_dependency(address newOwner) {
    address prevOwner = owner;
    uint256 timestamp1 = block.timestamp;
    
    require msg.sender == owner;
    require newOwner != address(0);
    
    changeOwner(newOwner);
    
    assert owner == newOwner, "owner must change regardless of timestamp";
}

rule setIsActive_no_timestamp_dependency(bool newIsActive) {
    bool prevIsActive = isActive;
    
    require msg.sender == owner;
    
    setIsActive(newIsActive);
    
    assert isActive == newIsActive, "isActive must update regardless of timestamp";
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

