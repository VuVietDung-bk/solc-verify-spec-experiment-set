/// @title Only owner can withdraw all funds
rule onlyOwnerCanWithdrawAllFunds(address to) {
    require msg.sender != owner;

    withdrawAllFunds(to);

    assert false, "non-owner should not be able to withdraw all funds";
}

/// @title Only owner can set limits
rule onlyOwnerCanSetLimits(uint256 minAmount, uint256 maxAmount) {
    require msg.sender != owner;

    setLimits(minAmount, maxAmount);

    assert false, "non-owner should not be able to set limits";
}

/// @title SetLimits updates min and max amounts
rule setLimitsUpdatesAmounts(uint256 minAmount, uint256 maxAmount) {
    require msg.sender == owner;
    require minAmount <= maxAmount;

    setLimits(minAmount, maxAmount);

    assert minSwapAmount == minAmount, "min swap amount must be updated";
    assert maxSwapAmount == maxAmount, "max swap amount must be updated";
}

/// @title Only owner can set swaps contract
rule onlyOwnerCanSetSwapsContract(address newSwapsContract) {
    require msg.sender != owner;

    setSwapsContract(newSwapsContract);

    assert false, "non-owner should not be able to set swaps contract";
}

/// @title Only owner can change active state
rule onlyOwnerCanSetIsActive(bool active) {
    require msg.sender != owner;

    setIsActive(active);

    assert false, "non-owner should not be able to change active state";
}
