variables {
    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) allowance;
    uint256 totalSupply;
}

rule transferEffects(address to, uint256 value) {
    uint256 senderBefore = balanceOf[msg.sender];
    uint256 receiverBefore = balanceOf[to];
    uint256 supplyBefore = totalSupply;

    transfer(to, value);

    uint256 senderAfter = balanceOf[msg.sender];
    uint256 receiverAfter = balanceOf[to];
    uint256 supplyAfter = totalSupply;

    assert to != msg.sender => senderAfter == senderBefore - value;
    assert to != msg.sender => receiverAfter == receiverBefore + value;
    assert to == msg.sender => senderAfter == senderBefore;
    assert to == msg.sender => receiverAfter == receiverBefore;
    assert supplyAfter == supplyBefore;
}

rule transferFromEffects(address from, address to, uint256 value) {
    uint256 fromBalanceBefore = balanceOf[from];
    uint256 toBalanceBefore = balanceOf[to];
    uint256 allowanceBefore = allowance[from][msg.sender];
    uint256 supplyBefore = totalSupply;

    transferFrom(from, to, value);

    uint256 fromBalanceAfter = balanceOf[from];
    uint256 toBalanceAfter = balanceOf[to];
    uint256 allowanceAfter = allowance[from][msg.sender];
    uint256 supplyAfter = totalSupply;

    assert to != from => fromBalanceAfter == fromBalanceBefore - value;
    assert to != from => toBalanceAfter == toBalanceBefore + value;
    assert to == from => fromBalanceAfter == fromBalanceBefore;
    assert to == from => toBalanceAfter == toBalanceBefore;
    assert allowanceAfter == allowanceBefore - value;
    assert supplyAfter == supplyBefore;
}

rule approveSetsExactValue(address spender, uint256 value) {
    approve(spender, value);
    assert allowance[msg.sender][spender] == value;
}

rule totalSupplyUnchangedForERC20Ops(method f) {
    uint256 supplyBefore = totalSupply;
    f();
    uint256 supplyAfter = totalSupply;

    assert (funcCompare(f, "transfer") || funcCompare(f, "transferFrom") || funcCompare(f, "approve")) => supplyAfter == supplyBefore;
}

invariant balancesNonNegative {
    assert forall address a. balanceOf[a] >= 0;
}
