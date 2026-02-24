// CVL Spec for TokenSender/Owned (0xec329...) - Unchecked low-level call
// execute() uses call without checking return value

methods {
    function changeOwner(address) external;
    function owner() external returns (address) envfree;
}

/**
 * Rule: changeOwner_changes_owner
 * changeOwner should change owner to new address.
 */
rule changeOwner_changes_owner(env e, address _newOwner) {
    require e.msg.sender == owner();
    
    changeOwner(e, _newOwner);
    
    assert owner() == _newOwner;
}
