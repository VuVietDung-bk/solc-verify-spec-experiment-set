variables
{
    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowed;
    uint256 _totalSupply;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address to, uint256 value) {
    uint256 balance_sender_before = _balances[msg.sender];
    uint256 balance_recip_before = _balances[to];

    transfer(to, value);

    uint256 balance_sender_after = _balances[msg.sender];
    uint256 balance_recip_after = _balances[to];

    assert to != msg.sender => balance_sender_after == balance_sender_before - value,
        "transfer must decrease sender's balance by value";

    assert to != msg.sender => balance_recip_after == balance_recip_before + value,
        "transfer must increase recipient's balance by value";
    
    assert to == msg.sender => balance_sender_after == balance_sender_before,
        "transfer to self must not change balance";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint256 value) {
    uint256 balance_from_before = _balances[from];
    uint256 balance_to_before = _balances[to];

    transferFrom(from, to, value);

    uint256 balance_from_after = _balances[from];
    uint256 balance_to_after = _balances[to];

    assert from != to => balance_from_after == balance_from_before - value,
        "transferFrom must decrease source balance by value";

    assert from != to => balance_to_after == balance_to_before + value,
        "transferFrom must increase destination balance by value";
}

/// @title Burn decreases sender balance and total supply
rule burnDecreasesBalance(uint256 value) {
    uint256 balance_before = _balances[msg.sender];
    uint256 supply_before = _totalSupply;

    burn(value);

    assert _balances[msg.sender] == balance_before - value,
        "burn must decrease sender balance";
    assert _totalSupply == supply_before - value,
        "burn must decrease total supply";
}

/// @title Approve sets correct allowance
rule approveUpdatesAllowance(address spender, uint256 value) {
    approve(spender, value);

    assert _allowed[msg.sender][spender] == value,
        "approve must set allowance to specified value";
}

/// @title IncreaseAllowance updates allowance correctly
rule increaseAllowanceUpdatesCorrectly(address spender, uint256 addedValue) {
    uint256 allowance_before = _allowed[msg.sender][spender];

    increaseAllowance(spender, addedValue);

    assert _allowed[msg.sender][spender] == allowance_before + addedValue,
        "increaseAllowance must add to current allowance";
}
