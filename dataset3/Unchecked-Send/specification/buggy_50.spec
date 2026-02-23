variables
{
    address manager;
    bool contractactive;
    uint hashfee;
    uint changehashownerfee;
    uint HashListLength;
}

/// @title Only manager can set hash fee
rule onlyManagerCanSetHashFee(uint newfee) {
    require msg.sender != manager;

    sethashfee(newfee);

    assert false, "non-manager should not be able to set hash fee";
}

/// @title SetHashFee updates hash fee
rule setHashFeeUpdatesFee(uint newfee) {
    require msg.sender == manager;

    sethashfee(newfee);

    assert hashfee == newfee, "hash fee must be updated";
}

/// @title Only manager can set change hash owner fee
rule onlyManagerCanSetChangeHashOwnerFee(uint newfee) {
    require msg.sender != manager;

    setchangehashownerfee(newfee);

    assert false, "non-manager should not be able to set change hash owner fee";
}

/// @title SetChangeHashOwnerFee updates fee
rule setChangeHashOwnerFeeUpdatesFee(uint newfee) {
    require msg.sender == manager;

    setchangehashownerfee(newfee);

    assert changehashownerfee == newfee, "change hash owner fee must be updated";
}

/// @title Only manager can set contract active
rule onlyManagerCanSetContractActive(bool active) {
    require msg.sender != manager;

    setcontractactive(active);

    assert false, "non-manager should not be able to set contract active";
}

/// @title SetContractActive updates state
rule setContractActiveUpdatesState(bool active) {
    require msg.sender == manager;

    setcontractactive(active);

    assert contractactive == active, "contract active state must be updated";
}

/// @title Only manager can set new manager
rule onlyManagerCanSetManager(address newmngr) {
    require msg.sender != manager;

    setmanager(newmngr);

    assert false, "non-manager should not be able to set new manager";
}

/// @title SetManager updates manager
rule setManagerUpdatesManager(address newmngr) {
    require msg.sender == manager;

    setmanager(newmngr);

    assert manager == newmngr, "manager must be updated";
}

/// @title RegisterHash increments hash list length
rule registerHashIncrementsLength(bytes32 hash) {
    require contractactive == true;
    uint length_before = HashListLength;

    registerHash(hash);

    assert HashListLength == length_before + 1,
        "hash list length must increment by 1";
}
