// Spec for CreditDepositBank - Gasless Send vulnerability
// The contract uses .send() without checking return values

variables {
    mapping(address => uint) balances;
    address owner;
    address manager;
}

// Rule: Only users with positive balance can take over ownership
rule takeover_requires_balance() {
    address ownerBefore = owner;
    uint balanceBefore = balances[msg.sender];
    
    takeOver();
    
    // If owner changed to sender, sender must have had positive balance
    assert (ownerBefore != msg.sender && owner == msg.sender) => (balanceBefore > 0);
}

// Rule: Owner does not change on deposit
rule deposit_no_owner_change() {
    address ownerBefore = owner;
    
    deposit();
    
    assert owner == ownerBefore;
}

// Rule: Manager does not change on deposit
rule deposit_no_manager_change() {
    address managerBefore = manager;
    
    deposit();
    
    assert manager == managerBefore;
}


