variables
{
    mapping (address => uint256) balances;
    uint256 totalSupply;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address recipient, uint256 amount) {
    uint256 balance_sender_before = balances[msg.sender];
    uint256 balance_recip_before = balances[recipient];

    transfer(recipient, amount);

    uint256 balance_sender_after = balances[msg.sender];
    uint256 balance_recip_after = balances[recipient];

    assert recipient != msg.sender => balance_sender_after == balance_sender_before - amount,
        "transfer must decrease sender's balance by amount";

    assert recipient != msg.sender => balance_recip_after == balance_recip_before + amount,
        "transfer must increase recipient's balance by amount";
    
    assert recipient == msg.sender => balance_sender_after == balance_sender_before,
        "transfer to self must not change balance";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint256 amount) {
    uint256 balance_from_before = balances[from];
    uint256 balance_to_before = balances[to];

    transferFrom(from, to, amount);

    uint256 balance_from_after = balances[from];
    uint256 balance_to_after = balances[to];

    assert from != to => balance_from_after == balance_from_before - amount,
        "transferFrom must decrease source balance by amount";

    assert from != to => balance_to_after == balance_to_before + amount,
        "transferFrom must increase destination balance by amount";
}

/// @title Approve sets correct allowance
rule approveUpdatesAllowance(address spender, uint256 value) {
    approve(spender, value);

    assert allowance(msg.sender, spender) == value,
        "approve must set allowance to specified value";
}
