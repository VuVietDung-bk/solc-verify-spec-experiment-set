// Timestamp-Dependency specification for Ownable (buggy_20.sol)

rule changeOwner_no_timestamp_dependency(address newOwner) {
    env e;
    require e.msg.sender == currentContract.owner;
    require newOwner != 0;

    changeOwner(e, newOwner);

    assert currentContract.owner == newOwner,
        "owner must change regardless of timestamp";
}
