/*
 * CVL Specification for buggy_33 - Staking Contract
 */

methods {
    function changeStakeTokens(uint256) external;
    function changeStakeTime(uint256) external;
    function changeStakingPercentage(uint) external;
    function lockWithdrawals() external;
    function owner() external returns (address) envfree;
    function lock() external returns (bool) envfree;
    function minstakeTokens() external returns (uint256) envfree;
    function stakeTime() external returns (uint256) envfree;
    function stakePercentage() external returns (uint) envfree;
}

/// @title Only owner can change stake tokens threshold
rule onlyOwnerCanChangeStakeTokens(uint256 newThreshold) {
    env e;
    
    require e.msg.sender != owner();

    changeStakeTokens@withrevert(e, newThreshold);

    assert lastReverted, "non-owner should not be able to change stake tokens threshold";
}

/// @title ChangeStakeTokens updates minimum stake
rule changeStakeTokensUpdatesMin(uint256 newThreshold) {
    env e;
    
    require e.msg.sender == owner();

    changeStakeTokens(e, newThreshold);

    assert minstakeTokens() == newThreshold * 10000000000,
        "minstakeTokens must be updated correctly";
}

/// @title Only owner can change stake time
rule onlyOwnerCanChangeStakeTime(uint256 newStakeTime) {
    env e;
    
    require e.msg.sender != owner();

    changeStakeTime@withrevert(e, newStakeTime);

    assert lastReverted, "non-owner should not be able to change stake time";
}

/// @title ChangeStakeTime updates stake time
rule changeStakeTimeUpdatesTime(uint256 newStakeTime) {
    env e;
    
    require e.msg.sender == owner();

    changeStakeTime(e, newStakeTime);

    assert stakeTime() == newStakeTime, "stakeTime must be updated";
}

/// @title Only owner can change staking percentage
rule onlyOwnerCanChangeStakingPercentage(uint newPercentage) {
    env e;
    
    require e.msg.sender != owner();

    changeStakingPercentage@withrevert(e, newPercentage);

    assert lastReverted, "non-owner should not be able to change staking percentage";
}

/// @title Only owner can lock withdrawals
rule onlyOwnerCanLockWithdrawals() {
    env e;
    
    require e.msg.sender != owner();

    lockWithdrawals@withrevert(e);

    assert lastReverted, "non-owner should not be able to lock withdrawals";
}

/// @title LockWithdrawals sets lock to true
rule lockWithdrawalsSetsLock() {
    env e;
    
    require e.msg.sender == owner();

    lockWithdrawals(e);

    assert lock() == true, "lock must be set to true";
}
