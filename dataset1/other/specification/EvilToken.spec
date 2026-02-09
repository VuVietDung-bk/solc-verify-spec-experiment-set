variables
{
    mapping (address => uint256) balanceOf;
    mapping (address => mapping (address => uint256)) allowance;
}

rule transferFrom_should_not_mint_to_contract(uint amount) {
    require amount > 0;
    require balanceOf[msg.sender] >= amount;
    require allowance[msg.sender][msg.sender] >= amount;

    uint beforeSum = balanceOf[msg.sender] + balanceOf[contract.address];
    transferFrom(msg.sender, msg.sender, amount);
    uint afterSum = balanceOf[msg.sender] + balanceOf[contract.address];

    // transferFrom should conserve balances; here the hidden mint inflates contract holdings.
    assert afterSum == beforeSum;
}
