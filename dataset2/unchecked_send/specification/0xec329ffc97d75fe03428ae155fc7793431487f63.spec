// Spec for TokenSender/Owned (0xec329...) - Unchecked low-level call
// execute() uses call without checking return value

variables {
    address owner;
}

/**
 * Rule: changeOwner_changes_owner
 * changeOwner should change owner to new address.
 */
rule changeOwner_changes_owner(address _newOwner) {
    require msg.sender == owner;
    
    changeOwner(_newOwner);
    
    assert owner == _newOwner;
}
