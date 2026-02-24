/*
 * CVL Specification for buggy_1 - ERC20 Token
 */

methods {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
    function allowance(address, address) external returns (uint256) envfree;
    function balanceOf(address) external returns (uint256) envfree;
    function totalSupply() external returns (uint256) envfree;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address recipient, uint256 amount) {
    env e;
    
    uint256 balance_sender_before = balanceOf(e.msg.sender);
    uint256 balance_recip_before = balanceOf(recipient);

    transfer(e, recipient, amount);

    uint256 balance_sender_after = balanceOf(e.msg.sender);
    uint256 balance_recip_after = balanceOf(recipient);

    assert recipient != e.msg.sender => balance_sender_after == balance_sender_before - amount,
        "transfer must decrease sender's balance by amount";

    assert recipient != e.msg.sender => balance_recip_after == balance_recip_before + amount,
        "transfer must increase recipient's balance by amount";
    
    assert recipient == e.msg.sender => balance_sender_after == balance_sender_before,
        "transfer to self must not change balance";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint256 amount) {
    env e;
    
    uint256 balance_from_before = balanceOf(from);
    uint256 balance_to_before = balanceOf(to);

    transferFrom(e, from, to, amount);

    uint256 balance_from_after = balanceOf(from);
    uint256 balance_to_after = balanceOf(to);

    assert from != to => balance_from_after == balance_from_before - amount,
        "transferFrom must decrease source balance by amount";

    assert from != to => balance_to_after == balance_to_before + amount,
        "transferFrom must increase destination balance by amount";
}

/// @title Approve sets correct allowance
rule approveUpdatesAllowance(address spender, uint256 value) {
    env e;
    
    approve(e, spender, value);

    assert allowance(e.msg.sender, spender) == value,
        "approve must set allowance to specified value";
}
