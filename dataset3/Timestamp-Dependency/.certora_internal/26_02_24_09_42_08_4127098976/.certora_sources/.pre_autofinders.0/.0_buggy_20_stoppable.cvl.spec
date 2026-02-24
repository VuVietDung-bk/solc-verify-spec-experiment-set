// Timestamp-Dependency specification for Stoppable (buggy_20.sol)

rule setIsActive_no_timestamp_dependency(bool newIsActive) {
    env e;
    require e.msg.sender == currentContract.owner;

    setIsActive(e, newIsActive);

    assert currentContract.isActive == newIsActive,
        "isActive must update regardless of timestamp";
}
