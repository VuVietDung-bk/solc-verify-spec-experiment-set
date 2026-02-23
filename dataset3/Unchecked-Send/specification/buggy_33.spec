variables
{
    address owner;
    bool lock;
    uint256 minstakeTokens;
    uint256 stakeTime;
    uint stakePercentage;
}

/// @title Only owner can change stake tokens threshold
rule onlyOwnerCanChangeStakeTokens(uint256 newThreshold) {
    require msg.sender != owner;

    changeStakeTokens(newThreshold);

    assert false, "non-owner should not be able to change stake tokens threshold";
}

/// @title ChangeStakeTokens updates minimum stake
rule changeStakeTokensUpdatesMin(uint256 newThreshold) {
    require msg.sender == owner;

    changeStakeTokens(newThreshold);

    assert minstakeTokens == newThreshold * 10000000000,
        "minstakeTokens must be updated correctly";
}

/// @title Only owner can change stake time
rule onlyOwnerCanChangeStakeTime(uint256 newStakeTime) {
    require msg.sender != owner;

    changeStakeTime(newStakeTime);

    assert false, "non-owner should not be able to change stake time";
}

/// @title ChangeStakeTime updates stake time
rule changeStakeTimeUpdatesTime(uint256 newStakeTime) {
    require msg.sender == owner;

    changeStakeTime(newStakeTime);

    assert stakeTime == newStakeTime, "stakeTime must be updated";
}

/// @title Only owner can change staking percentage
rule onlyOwnerCanChangeStakingPercentage(uint newPercentage) {
    require msg.sender != owner;

    changeStakingPercentage(newPercentage);

    assert false, "non-owner should not be able to change staking percentage";
}

/// @title Only owner can lock withdrawals
rule onlyOwnerCanLockWithdrawals() {
    require msg.sender != owner;

    lockWithdrawals();

    assert false, "non-owner should not be able to lock withdrawals";
}

/// @title LockWithdrawals sets lock to true
rule lockWithdrawalsSetsLock() {
    require msg.sender == owner;

    lockWithdrawals();

    assert lock == true, "lock must be set to true";
}
