methods {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
}

/// @title transfer moves balances and preserves supply
rule transferMovesBalances(env e, address receiver, uint256 amount) {
    uint256 senderBefore = currentContract.userBalances[e.msg.sender];
    uint256 receiverBefore = currentContract.userBalances[receiver];
    uint256 supplyBefore = currentContract._totalSupply;

    transfer(e, receiver, amount);

    uint256 senderAfter = currentContract.userBalances[e.msg.sender];
    uint256 receiverAfter = currentContract.userBalances[receiver];
    uint256 supplyAfter = currentContract._totalSupply;

    assert receiver != e.msg.sender => senderAfter == senderBefore - amount;
    assert receiver != e.msg.sender => receiverAfter == receiverBefore + amount;
    assert receiver == e.msg.sender => senderAfter == senderBefore;
    assert receiver == e.msg.sender => receiverAfter == receiverBefore;
    assert supplyAfter == supplyBefore;
}

/// @title transferFrom moves balances and adjusts allowance
rule transferFromMovesBalances(env e, address from, address receiver, uint256 amount) {
    uint256 fromBefore = currentContract.userBalances[from];
    uint256 toBefore = currentContract.userBalances[receiver];
    uint256 allowanceBefore = currentContract.userAllowances[from][e.msg.sender];
    uint256 supplyBefore = currentContract._totalSupply;

    transferFrom(e, from, receiver, amount);

    uint256 fromAfter = currentContract.userBalances[from];
    uint256 toAfter = currentContract.userBalances[receiver];
    uint256 allowanceAfter = currentContract.userAllowances[from][e.msg.sender];
    uint256 supplyAfter = currentContract._totalSupply;

    assert receiver != from => fromAfter == fromBefore - amount;
    assert receiver != from => toAfter == toBefore + amount;
    assert receiver == from => fromAfter == fromBefore;
    assert receiver == from => toAfter == toBefore;
    assert allowanceAfter == allowanceBefore - amount;
    assert supplyAfter == supplyBefore;
}

/// @title approve sets exact allowance
rule approveSetsAllowance(env e, address spender, uint256 amount) {
    approve(e, spender, amount);

    assert currentContract.userAllowances[e.msg.sender][spender] == amount;
}

/// @title Only owner can change totalSupply
rule onlyOwnerChangesTotalSupply(env e, method f) {
    uint256 supplyBefore = currentContract._totalSupply;

    calldataarg args;
    f(e, args);

    uint256 supplyAfter = currentContract._totalSupply;
    assert supplyAfter != supplyBefore => e.msg.sender == currentContract.owner;
}
