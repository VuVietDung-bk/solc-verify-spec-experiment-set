variables {
    address creator;
    mapping(address => uint256) balances;
}

/**
 * Anyone can call initWallet to change the creator.
 */
rule anyone_can_become_creator(address attacker) { 
    require msg.sender != creator;
    require creator != address(0);

    initWallet();

    assert creator != msg.sender, "Access Control failure: anyone can become the creator";
}

/**
 * Verify that after becoming the creator, they can migrate funds.
 * Note: Each rule only calls ONE contract function.
 */
rule unauthorized_migration(address to) {   
    // Assume someone already took over the creator role
    // This state is reachable because initWallet has no access control
    require msg.sender == creator;
    require creator != address(0);

    migrateTo(to);

    assert contract.balance != 0, "Security failure: non-original creator drained the contract";
}

/**
 * Ensure withdrawal reduces the user's balance correctly.
 */
rule withdrawal_integrity(uint256 amount) {
    uint256 balance_before = balances[msg.sender];
    
    require amount <= balance_before;
    
    withdraw(amount);

    assert balances[msg.sender] == balance_before - amount, "Integrity failure: balance not updated correctly";
}

/**
 * Check if the owner can be changed by any function other than initWallet.
 */
rule owner_is_constant_on_other_functions(method f) {
    address owner_before = creator;
    
    require !funcCompare(f, "initWallet");
    
    f();

    assert creator == owner_before, "Access Control: owner changed by unauthorized function";
}