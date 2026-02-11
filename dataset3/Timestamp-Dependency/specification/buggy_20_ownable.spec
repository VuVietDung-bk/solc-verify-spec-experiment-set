variables {
    uint256 bugv_tmstmp5;
}

rule changeOwner_no_timestamp_dependency(address newOwner) {
    address prevOwner = owner;
    uint256 timestamp1 = block.timestamp;
    require msg.sender == owner;
    require newOwner != address(0);
    changeOwner(newOwner);
    assert owner == newOwner, "owner must change regardless of timestamp";
}
