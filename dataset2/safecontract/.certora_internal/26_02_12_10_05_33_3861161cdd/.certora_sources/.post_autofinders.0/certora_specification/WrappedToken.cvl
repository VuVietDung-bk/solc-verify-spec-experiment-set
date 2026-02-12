methods {
    function wrap(uint256) external;
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
}

/// @title wrap mints wrapped tokens 1:1
rule wrapMintsTokens(env e, uint256 amount) {
    uint256 balanceBefore = currentContract._balances[e.msg.sender];
    uint256 supplyBefore = currentContract._totalSupply;

    wrap(e, amount);

    uint256 balanceAfter = currentContract._balances[e.msg.sender];
    uint256 supplyAfter = currentContract._totalSupply;

    assert balanceAfter == balanceBefore + amount;
    assert supplyAfter == supplyBefore + amount;
}

/// @title transfer moves balances and preserves supply
rule transferMovesBalances(env e, address recipient, uint256 amount) {
    uint256 senderBefore = currentContract._balances[e.msg.sender];
    uint256 recipientBefore = currentContract._balances[recipient];
    uint256 supplyBefore = currentContract._totalSupply;

    transfer(e, recipient, amount);

    uint256 senderAfter = currentContract._balances[e.msg.sender];
    uint256 recipientAfter = currentContract._balances[recipient];
    uint256 supplyAfter = currentContract._totalSupply;

    assert recipient != e.msg.sender => senderAfter == senderBefore - amount;
    assert recipient != e.msg.sender => recipientAfter == recipientBefore + amount;
    assert recipient == e.msg.sender => senderAfter == senderBefore;
    assert recipient == e.msg.sender => recipientAfter == recipientBefore;
    assert supplyAfter == supplyBefore;
}

/// @title transferFrom adjusts balances and allowance
rule transferFromAdjustsAllowance(env e, address sender, address recipient, uint256 amount) {
    uint256 senderBalanceBefore = currentContract._balances[sender];
    uint256 recipientBalanceBefore = currentContract._balances[recipient];
    uint256 allowanceBefore = currentContract._allowances[sender][e.msg.sender];
    uint256 supplyBefore = currentContract._totalSupply;

    transferFrom(e, sender, recipient, amount);

    uint256 senderBalanceAfter = currentContract._balances[sender];
    uint256 recipientBalanceAfter = currentContract._balances[recipient];
    uint256 allowanceAfter = currentContract._allowances[sender][e.msg.sender];
    uint256 supplyAfter = currentContract._totalSupply;

    assert recipient != sender => senderBalanceAfter == senderBalanceBefore - amount;
    assert recipient != sender => recipientBalanceAfter == recipientBalanceBefore + amount;
    assert recipient == sender => senderBalanceAfter == senderBalanceBefore;
    assert recipient == sender => recipientBalanceAfter == recipientBalanceBefore;
    assert allowanceAfter == allowanceBefore - amount;
    assert supplyAfter == supplyBefore;
}

/// @title approve sets exact allowance
rule approveSetsAllowance(env e, address spender, uint256 amount) {
    approve(e, spender, amount);

    assert currentContract._allowances[e.msg.sender][spender] == amount;
}
