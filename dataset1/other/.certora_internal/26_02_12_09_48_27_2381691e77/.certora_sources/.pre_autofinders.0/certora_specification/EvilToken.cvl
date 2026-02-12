methods {
    function transferFrom(address, address, uint256) external returns (bool);
}

/// @title transferFrom must not mint tokens (balance sum conserved)
rule transferFrom_should_not_mint_to_contract(env e, uint256 amount) {
    require amount > 0;
    require currentContract.balanceOf[e.msg.sender] >= amount;
    require currentContract.allowance[e.msg.sender][e.msg.sender] >= amount;

    uint256 beforeSum = currentContract.balanceOf[e.msg.sender] + currentContract.balanceOf[currentContract];
    
    transferFrom(e, e.msg.sender, e.msg.sender, amount);
    
    uint256 afterSum = currentContract.balanceOf[e.msg.sender] + currentContract.balanceOf[currentContract];
    assert afterSum == beforeSum;
}
