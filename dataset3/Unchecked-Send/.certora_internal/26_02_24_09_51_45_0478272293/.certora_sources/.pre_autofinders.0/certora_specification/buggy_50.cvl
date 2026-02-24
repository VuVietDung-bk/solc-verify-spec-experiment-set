/*
 * CVL Specification for buggy_50 - Hash Registry Contract
 */

methods {
    function sethashfee(uint) external;
    function setchangehashownerfee(uint) external;
    function setcontractactive(bool) external;
    function setmanager(address) external;
    function registerHash(bytes32) external;
    function getmanager() external returns (address) envfree;
    function getcontractactive() external returns (bool) envfree;
    function gethashfee() external returns (uint) envfree;
    function getchangehashownerfee() external returns (uint) envfree;
    function getNumberofHashesRegistered() external returns (uint) envfree;
}

/// @title Only manager can set hash fee
rule onlyManagerCanSetHashFee(uint newfee) {
    env e;
    
    require e.msg.sender != getmanager();

    sethashfee@withrevert(e, newfee);

    assert lastReverted, "non-manager should not be able to set hash fee";
}

/// @title SetHashFee updates hash fee
rule setHashFeeUpdatesFee(uint newfee) {
    env e;
    
    require e.msg.sender == getmanager();

    sethashfee(e, newfee);

    assert gethashfee() == newfee, "hash fee must be updated";
}

/// @title Only manager can set change hash owner fee
rule onlyManagerCanSetChangeHashOwnerFee(uint newfee) {
    env e;
    
    require e.msg.sender != getmanager();

    setchangehashownerfee@withrevert(e, newfee);

    assert lastReverted, "non-manager should not be able to set change hash owner fee";
}

/// @title SetChangeHashOwnerFee updates fee
rule setChangeHashOwnerFeeUpdatesFee(uint newfee) {
    env e;
    
    require e.msg.sender == getmanager();

    setchangehashownerfee(e, newfee);

    assert getchangehashownerfee() == newfee, "change hash owner fee must be updated";
}

/// @title Only manager can set contract active
rule onlyManagerCanSetContractActive(bool active) {
    env e;
    
    require e.msg.sender != getmanager();

    setcontractactive@withrevert(e, active);

    assert lastReverted, "non-manager should not be able to set contract active";
}

/// @title SetContractActive updates state
rule setContractActiveUpdatesState(bool active) {
    env e;
    
    require e.msg.sender == getmanager();

    setcontractactive(e, active);

    assert getcontractactive() == active, "contract active state must be updated";
}

/// @title Only manager can set new manager
rule onlyManagerCanSetManager(address newmngr) {
    env e;
    
    require e.msg.sender != getmanager();

    setmanager@withrevert(e, newmngr);

    assert lastReverted, "non-manager should not be able to set new manager";
}

/// @title SetManager updates manager
rule setManagerUpdatesManager(address newmngr) {
    env e;
    
    require e.msg.sender == getmanager();

    setmanager(e, newmngr);

    assert getmanager() == newmngr, "manager must be updated";
}

/// @title RegisterHash increments hash list length
rule registerHashIncrementsLength(bytes32 hash) {
    env e;
    
    require getcontractactive() == true;
    uint length_before = getNumberofHashesRegistered();

    registerHash(e, hash);

    assert getNumberofHashesRegistered() == length_before + 1,
        "hash list length must increment by 1";
}
