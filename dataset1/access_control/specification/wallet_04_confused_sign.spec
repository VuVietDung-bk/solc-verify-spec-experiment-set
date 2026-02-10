variables {
    mapping(address => uint256) balances;
}

rule withdraw_integrity(uint256 amount) {
    uint256 balance_before = balances[msg.sender];
    
    // Action: withdraw an amount strictly greater than the current balance
    require amount > balance_before;
    require contract.balance >= amount;

    withdraw(amount);

    // If the contract logic is safe, the line above should revert.
    // If it reaches here, the security property is violated.
    assert false, "Security failure: user can withdraw more than their balance";
}

rule balance_decreases_on_withdraw(uint256 amount) {
    uint256 balance_before = balances[msg.sender];
    
    // Assume a valid withdrawal amount according to correct business logic
    require amount <= balance_before;
    require amount > 0;

    withdraw(amount);

    uint256 balance_after = balances[msg.sender];
    
    assert balance_after < balance_before, "Integrity failure: balance must decrease after withdrawal";
}

rule only_creator_can_migrate(address to) {
    address current_creator; // Assume mapping to the 'creator' state variable
    require msg.sender != current_creator;

    migrateTo(to);

    assert_revert;
}