/*
 * CVL Specification for buggy_34 - ERC20 Token with Max Supply
 */

methods {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
    function increaseAllowance(address, uint256) external returns (bool);
    function decreaseAllowance(address, uint256) external returns (bool);
    function balanceOf(address) external returns (uint256) envfree;
    function allowance(address, address) external returns (uint256) envfree;
    function totalSupply() external returns (uint256) envfree;
    function maxTotalSupply() external returns (uint256) envfree;
    function owner() external returns (address) envfree;
}

/// @title Transfer must update balances correctly
rule transferUpdatesBalances(address recipient, uint256 amount) {
    env e;
    
    uint256 balance_sender_before = balanceOf(e.msg.sender);
    uint256 balance_recip_before = balanceOf(recipient);

    transfer(e, recipient, amount);

    uint256 balance_sender_after = balanceOf(e.msg.sender);
    uint256 balance_recip_after = balanceOf(recipient);

    assert recipient != e.msg.sender => balance_sender_after <= balance_sender_before,
        "transfer must not increase sender's balance";

    assert recipient != e.msg.sender => balance_recip_after >= balance_recip_before,
        "transfer must not decrease recipient's balance";
}

/// @title TransferFrom must update balances correctly
rule transferFromUpdatesBalances(address sender, address recipient, uint256 amount) {
    env e;
    
    uint256 balance_sender_before = balanceOf(sender);
    uint256 balance_recip_before = balanceOf(recipient);

    transferFrom(e, sender, recipient, amount);

    uint256 balance_sender_after = balanceOf(sender);
    uint256 balance_recip_after = balanceOf(recipient);

    assert sender != recipient => balance_sender_after <= balance_sender_before,
        "transferFrom must not increase sender's balance";

    assert sender != recipient => balance_recip_after >= balance_recip_before,
        "transferFrom must not decrease recipient's balance";
}

/// @title Approve sets correct allowance
rule approveUpdatesAllowance(address spender, uint256 value) {
    env e;
    
    approve(e, spender, value);

    assert allowance(e.msg.sender, spender) == value,
        "approve must set allowance to specified value";
}

/// @title IncreaseAllowance updates allowance correctly
rule increaseAllowanceUpdatesCorrectly(address spender, uint256 addedValue) {
    env e;
    
    uint256 allowance_before = allowance(e.msg.sender, spender);

    increaseAllowance(e, spender, addedValue);

    assert allowance(e.msg.sender, spender) == allowance_before + addedValue,
        "increaseAllowance must add to current allowance";
}

/// @title DecreaseAllowance updates allowance correctly
rule decreaseAllowanceUpdatesCorrectly(address spender, uint256 subtractedValue) {
    env e;
    
    uint256 allowance_before = allowance(e.msg.sender, spender);

    decreaseAllowance(e, spender, subtractedValue);

    assert allowance(e.msg.sender, spender) == allowance_before - subtractedValue,
        "decreaseAllowance must subtract from current allowance";
}

/// @title Total supply never exceeds max total supply
invariant totalSupplyBounded()
    totalSupply() <= maxTotalSupply()
    { preserved { require true; } }
