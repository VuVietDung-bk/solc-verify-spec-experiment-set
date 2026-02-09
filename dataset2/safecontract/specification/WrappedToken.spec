variables {
    uint256 _totalSupply;
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;
    address underlyingAsset;
}

rule wrapMintsTokens(uint256 amount) {
    uint256 balanceBefore = _balances[msg.sender];
    uint256 supplyBefore = _totalSupply;

    wrap(amount);

    uint256 balanceAfter = _balances[msg.sender];
    uint256 supplyAfter = _totalSupply;

    assert balanceAfter == balanceBefore + amount;
    assert supplyAfter == supplyBefore + amount;
}

rule transferMovesBalances(address recipient, uint256 amount) {
    uint256 senderBefore = _balances[msg.sender];
    uint256 recipientBefore = _balances[recipient];
    uint256 supplyBefore = _totalSupply;

    transfer(recipient, amount);

    uint256 senderAfter = _balances[msg.sender];
    uint256 recipientAfter = _balances[recipient];
    uint256 supplyAfter = _totalSupply;

    assert recipient != msg.sender => senderAfter == senderBefore - amount;
    assert recipient != msg.sender => recipientAfter == recipientBefore + amount;
    assert recipient == msg.sender => senderAfter == senderBefore;
    assert recipient == msg.sender => recipientAfter == recipientBefore;
    assert supplyAfter == supplyBefore;
}

rule transferFromAdjustsAllowance(address sender, address recipient, uint256 amount) {
    uint256 senderBalanceBefore = _balances[sender];
    uint256 recipientBalanceBefore = _balances[recipient];
    uint256 allowanceBefore = _allowances[sender][msg.sender];
    uint256 supplyBefore = _totalSupply;

    transferFrom(sender, recipient, amount);

    uint256 senderBalanceAfter = _balances[sender];
    uint256 recipientBalanceAfter = _balances[recipient];
    uint256 allowanceAfter = _allowances[sender][msg.sender];
    uint256 supplyAfter = _totalSupply;

    assert recipient != sender => senderBalanceAfter == senderBalanceBefore - amount;
    assert recipient != sender => recipientBalanceAfter == recipientBalanceBefore + amount;
    assert recipient == sender => senderBalanceAfter == senderBalanceBefore;
    assert recipient == sender => recipientBalanceAfter == recipientBalanceBefore;
    assert allowanceAfter == allowanceBefore - amount;
    assert supplyAfter == supplyBefore;
}

rule approveSetsAllowance(address spender, uint256 amount) {
    approve(spender, amount);
    assert _allowances[msg.sender][spender] == amount;
}
