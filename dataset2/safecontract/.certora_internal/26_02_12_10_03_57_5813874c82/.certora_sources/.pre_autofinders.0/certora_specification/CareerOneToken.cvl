methods {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
}

/// @title transfer moves balances correctly and preserves supply
rule transferEffects(env e, address to, uint256 value) {
    uint256 senderBefore = currentContract.balanceOf[e.msg.sender];
    uint256 receiverBefore = currentContract.balanceOf[to];
    uint256 supplyBefore = currentContract.totalSupply;

    transfer(e, to, value);

    uint256 senderAfter = currentContract.balanceOf[e.msg.sender];
    uint256 receiverAfter = currentContract.balanceOf[to];
    uint256 supplyAfter = currentContract.totalSupply;

    assert to != e.msg.sender => senderAfter == senderBefore - value;
    assert to != e.msg.sender => receiverAfter == receiverBefore + value;
    assert to == e.msg.sender => senderAfter == senderBefore;
    assert to == e.msg.sender => receiverAfter == receiverBefore;
    assert supplyAfter == supplyBefore;
}

/// @title transferFrom moves balances and adjusts allowance
rule transferFromEffects(env e, address from, address to, uint256 value) {
    uint256 fromBalanceBefore = currentContract.balanceOf[from];
    uint256 toBalanceBefore = currentContract.balanceOf[to];
    uint256 allowanceBefore = currentContract.allowance[from][e.msg.sender];
    uint256 supplyBefore = currentContract.totalSupply;

    transferFrom(e, from, to, value);

    uint256 fromBalanceAfter = currentContract.balanceOf[from];
    uint256 toBalanceAfter = currentContract.balanceOf[to];
    uint256 allowanceAfter = currentContract.allowance[from][e.msg.sender];
    uint256 supplyAfter = currentContract.totalSupply;

    assert to != from => fromBalanceAfter == fromBalanceBefore - value;
    assert to != from => toBalanceAfter == toBalanceBefore + value;
    assert to == from => fromBalanceAfter == fromBalanceBefore;
    assert to == from => toBalanceAfter == toBalanceBefore;
    assert allowanceAfter == allowanceBefore - value;
    assert supplyAfter == supplyBefore;
}

/// @title approve sets exact allowance value
rule approveSetsExactValue(env e, address spender, uint256 value) {
    approve(e, spender, value);

    assert currentContract.allowance[e.msg.sender][spender] == value;
}

/// @title totalSupply unchanged by ERC20 ops
rule totalSupplyUnchangedForERC20Ops(env e, method f)
    filtered { f -> f.selector == sig:transfer(address, uint256).selector
                 || f.selector == sig:transferFrom(address, address, uint256).selector
                 || f.selector == sig:approve(address, uint256).selector }
{
    uint256 supplyBefore = currentContract.totalSupply;

    calldataarg args;
    f(e, args);

    uint256 supplyAfter = currentContract.totalSupply;
    assert supplyAfter == supplyBefore;
}
