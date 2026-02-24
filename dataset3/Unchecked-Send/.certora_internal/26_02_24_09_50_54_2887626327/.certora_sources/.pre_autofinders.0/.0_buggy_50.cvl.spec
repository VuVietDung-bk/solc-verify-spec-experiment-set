/*
 * CVL Specification for buggy_50 - Hash Registry Contract
 */

methods {
    function sethashfee(uint) external;
    function setchangehashownerfee(uint) external;
    function setcontractactive(bool) external;
    function setmanager(address) external;
    function registerHash(bytes32) external;
    function manager() external returns (address) envfree;
    function contractactive() external returns (bool) envfree;
    function hashfee() external returns (uint) envfree;
    function changehashownerfee() external returns (uint) envfree;
    function HashListLength() external returns (uint) envfree;
}

/// @title Only manager can set hash fee
rule onlyManagerCanSetHashFee(uint newfee) {
    env e;
    
    require e.msg.sender != manager();

    sethashfee@withrevert(e, newfee);

    assert lastReverted, "non-manager should not be able to set hash fee";
}

/// @title SetHashFee updates hash fee
rule setHashFeeUpdatesFee(uint newfee) {
    env e;
    
    require e.msg.sender == manager();

    sethashfee(e, newfee);

    assert hashfee() == newfee, "hash fee must be updated";
}

/// @title Only manager can set change hash owner fee
rule onlyManagerCanSetChangeHashOwnerFee(uint newfee) {
    env e;
    
    require e.msg.sender != manager();

    setchangehashownerfee@withrevert(e, newfee);

    assert lastReverted, "non-manager should not be able to set change hash owner fee";
}

/// @title SetChangeHashOwnerFee updates fee
rule setChangeHashOwnerFeeUpdatesFee(uint newfee) {
    env e;
    
    require e.msg.sender == manager();

    setchangehashownerfee(e, newfee);

    assert changehashownerfee() == newfee, "change hash owner fee must be updated";
}

/// @title Only manager can set contract active
rule onlyManagerCanSetContractActive(bool active) {
    env e;
    
    require e.msg.sender != manager();

    setcontractactive@withrevert(e, active);

    assert lastReverted, "non-manager should not be able to set contract active";
}

/// @title SetContractActive updates state
rule setContractActiveUpdatesState(bool active) {
    env e;
    
    require e.msg.sender == manager();

    setcontractactive(e, active);

    assert contractactive() == active, "contract active state must be updated";
}

/// @title Only manager can set new manager
rule onlyManagerCanSetManager(address newmngr) {
    env e;
    
    require e.msg.sender != manager();

    setmanager@withrevert(e, newmngr);

    assert lastReverted, "non-manager should not be able to set new manager";
}

/// @title SetManager updates manager
rule setManagerUpdatesManager(address newmngr) {
    env e;
    
    require e.msg.sender == manager();

    setmanager(e, newmngr);

    assert manager() == newmngr, "manager must be updated";
}

/// @title RegisterHash increments hash list length
rule registerHashIncrementsLength(bytes32 hash) {
    env e;
    
    require contractactive() == true;
    uint length_before = HashListLength();

    registerHash(e, hash);

    assert HashListLength() == length_before + 1,
        "hash list length must increment by 1";
}
