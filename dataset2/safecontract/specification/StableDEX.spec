variables {
    address owner;
    bool transferStatus;
    uint256 _totalSupply;
    mapping(address => uint256) userBalances;
    mapping(address => mapping(address => uint256)) userAllowances;
}

rule transferMovesBalances(address receiver, uint256 amount) {
    uint256 senderBefore = userBalances[msg.sender];
    uint256 receiverBefore = userBalances[receiver];
    uint256 supplyBefore = _totalSupply;

    transfer(receiver, amount);

    uint256 senderAfter = userBalances[msg.sender];
    uint256 receiverAfter = userBalances[receiver];
    uint256 supplyAfter = _totalSupply;

    assert receiver != msg.sender => senderAfter == senderBefore - amount;
    assert receiver != msg.sender => receiverAfter == receiverBefore + amount;
    assert receiver == msg.sender => senderAfter == senderBefore;
    assert receiver == msg.sender => receiverAfter == receiverBefore;
    assert supplyAfter == supplyBefore;
}

rule transferFromMovesBalances(address from, address receiver, uint256 amount) {
    uint256 fromBefore = userBalances[from];
    uint256 toBefore = userBalances[receiver];
    uint256 allowanceBefore = userAllowances[from][msg.sender];
    uint256 supplyBefore = _totalSupply;

    transferFrom(from, receiver, amount);

    uint256 fromAfter = userBalances[from];
    uint256 toAfter = userBalances[receiver];
    uint256 allowanceAfter = userAllowances[from][msg.sender];
    uint256 supplyAfter = _totalSupply;

    assert receiver != from => fromAfter == fromBefore - amount;
    assert receiver != from => toAfter == toBefore + amount;
    assert receiver == from => fromAfter == fromBefore;
    assert receiver == from => toAfter == toBefore;
    assert allowanceAfter == allowanceBefore - amount;
    assert supplyAfter == supplyBefore;
}

rule approveSetsAllowance(address spender, uint256 amount) {
    approve(spender, amount);
    assert userAllowances[msg.sender][spender] == amount;
}

rule onlyOwnerChangesTotalSupply(method f) {
    uint256 supplyBefore = _totalSupply;
    f();
    uint256 supplyAfter = _totalSupply;
    assert supplyAfter != supplyBefore => msg.sender == owner;
}

