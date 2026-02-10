variables {
    mapping(address => uint256) balances;
    address creator;
}

/**
 * Rule: integrity_of_refund
 * Checks that after a refund, the user's balance in the mapping must decrease.
 * This will fail because the contract does not update balances[msg.sender].
 */
rule integrity_of_refund() {
    uint256 balance_before = balances[msg.sender];
    
    require balance_before > 0;

    refund();

    uint256 balance_after = balances[msg.sender];

    assert balance_after == 0, "Lỗ hổng: Số dư không được reset về 0 sau khi hoàn tiền";
}

/**
 * Rule: balance_consistency_on_withdraw
 * Ensures that withdraw function correctly updates the balance.
 */
rule balance_consistency_on_withdraw(uint256 amount) {
    uint256 balance_before = balances[msg.sender];
    
    require amount <= balance_before;

    withdraw(amount);

    uint256 balance_after = balances[msg.sender];

    assert balance_after == balance_before - amount, "Lỗi: Số dư cập nhật sai sau khi rút tiền";
}

/**
 * Rule: only_creator_can_migrate
 * Access control check for emergency migration.
 */
rule only_creator_can_migrate(address to) {
    address current_caller = msg.sender;
    
    require current_caller != creator;

    migrateTo(to);

    assert_revert;
}

/**
 * Rule: refund_affects_contract_balance
 * Proves that a refund reduces the contract's total ether balance.
 */
rule refund_affects_contract_balance() {
    uint256 contract_balance_before = contract.balance;
    uint256 user_storage_balance = balances[msg.sender];

    require user_storage_balance > 0;
    require contract_balance_before >= user_storage_balance;

    refund();

    uint256 contract_balance_after = contract.balance;

    assert contract_balance_after == contract_balance_before - user_storage_balance;
}