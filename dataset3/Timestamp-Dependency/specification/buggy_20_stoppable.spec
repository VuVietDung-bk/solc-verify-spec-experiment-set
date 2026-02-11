variables {
    uint256 bugv_tmstmp1;
}

rule setIsActive_no_timestamp_dependency(bool newIsActive) {
    bool prevIsActive = isActive;
    require msg.sender == owner;
    setIsActive(newIsActive);
    assert isActive == newIsActive, "isActive must update regardless of timestamp";
}
