methods {
    function increaseLockTime(uint256) external;
}

/// @title increaseLockTime must not overflow: result == old + inc
rule locktime_monotone(env e, uint256 inc) {
    uint256 beforeLock = currentContract.lockTime[e.msg.sender];

    increaseLockTime(e, inc);

    uint256 afterLock = currentContract.lockTime[e.msg.sender];
    assert afterLock == beforeLock + inc;
}
