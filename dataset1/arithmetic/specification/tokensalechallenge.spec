variables
{
    mapping (address => uint256) balanceOf;
}

rule buy_adds_balance(uint256 numTokens) {
    buy(numTokens);
    assert balanceOf[msg.sender] == __verifier_old_uint(balanceOf[msg.sender]) + numTokens;
}

rule sell_decreases_balance(uint256 numTokens) {
    require balanceOf[msg.sender] >= numTokens;
    uint256 beforeBal = balanceOf[msg.sender];
    sell(numTokens);
    uint256 afterBal = balanceOf[msg.sender];
    assert afterBal == beforeBal - numTokens;
}
