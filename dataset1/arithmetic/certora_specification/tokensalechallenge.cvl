methods {
    function buy(uint256) external;
    function sell(uint256) external;
}

/// @title buy must increase balance by numTokens
rule buy_adds_balance(env e, uint256 numTokens) {
    uint256 beforeBal = currentContract.balanceOf[e.msg.sender];

    buy(e, numTokens);

    uint256 afterBal = currentContract.balanceOf[e.msg.sender];
    assert afterBal == beforeBal + numTokens;
}

/// @title sell must decrease balance by numTokens
rule sell_decreases_balance(env e, uint256 numTokens) {
    require currentContract.balanceOf[e.msg.sender] >= numTokens;

    uint256 beforeBal = currentContract.balanceOf[e.msg.sender];

    sell(e, numTokens);

    uint256 afterBal = currentContract.balanceOf[e.msg.sender];
    assert afterBal == beforeBal - numTokens;
}
