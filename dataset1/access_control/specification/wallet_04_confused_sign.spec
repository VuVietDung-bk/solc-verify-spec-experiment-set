variables
{
    mapping (address => uint256) balances;
}

rule withdraw_respects_balance(uint256 amount) {
    require amount <= balances[msg.sender];
    uint256 beforeBal = balances[msg.sender];
    withdraw(amount);
    uint256 afterBal = balances[msg.sender];
    assert afterBal == beforeBal - amount;
}