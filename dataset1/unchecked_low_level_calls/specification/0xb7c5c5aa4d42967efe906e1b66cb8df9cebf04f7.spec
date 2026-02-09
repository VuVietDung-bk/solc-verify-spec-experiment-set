variables
{
    mapping (address => uint256) balances;
}

rule withdraw_resets_balance() {
    require balances[msg.sender] > 0;
    uint256 contractBefore = contract.balance;
    uint256 owed = balances[msg.sender];
    withdraw();
    uint256 contractAfter = contract.balance;
    assert balances[msg.sender] == 0;
    assert contractAfter == contractBefore - owed;
}
