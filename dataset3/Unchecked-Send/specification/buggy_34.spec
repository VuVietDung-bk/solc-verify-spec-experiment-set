variables
{
    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowances;
    uint256 _totalSupply;
    uint256 _maxTotalSupply;
    address owner;
}

/// @title Transfer must update balances correctly
rule transferUpdatesBalances(address recipient, uint256 amount) {
    uint256 balance_sender_before = _balances[msg.sender];
    uint256 balance_recip_before = _balances[recipient];

    transfer(recipient, amount);

    uint256 balance_sender_after = _balances[msg.sender];
    uint256 balance_recip_after = _balances[recipient];

    assert recipient != msg.sender => balance_sender_after <= balance_sender_before,
        "transfer must not increase sender's balance";

    assert recipient != msg.sender => balance_recip_after >= balance_recip_before,
        "transfer must not decrease recipient's balance";
}

/// @title TransferFrom must update balances correctly
rule transferFromUpdatesBalances(address sender, address recipient, uint256 amount) {
    uint256 balance_sender_before = _balances[sender];
    uint256 balance_recip_before = _balances[recipient];

    transferFrom(sender, recipient, amount);

    uint256 balance_sender_after = _balances[sender];
    uint256 balance_recip_after = _balances[recipient];

    assert sender != recipient => balance_sender_after <= balance_sender_before,
        "transferFrom must not increase sender's balance";

    assert sender != recipient => balance_recip_after >= balance_recip_before,
        "transferFrom must not decrease recipient's balance";
}

/// @title Approve sets correct allowance
rule approveUpdatesAllowance(address spender, uint256 value) {
    approve(spender, value);

    assert _allowances[msg.sender][spender] == value,
        "approve must set allowance to specified value";
}

/// @title IncreaseAllowance updates allowance correctly
rule increaseAllowanceUpdatesCorrectly(address spender, uint256 addedValue) {
    uint256 allowance_before = _allowances[msg.sender][spender];

    increaseAllowance(spender, addedValue);

    assert _allowances[msg.sender][spender] == allowance_before + addedValue,
        "increaseAllowance must add to current allowance";
}

/// @title DecreaseAllowance updates allowance correctly
rule decreaseAllowanceUpdatesCorrectly(address spender, uint256 subtractedValue) {
    uint256 allowance_before = _allowances[msg.sender][spender];

    decreaseAllowance(spender, subtractedValue);

    assert _allowances[msg.sender][spender] == allowance_before - subtractedValue,
        "decreaseAllowance must subtract from current allowance";
}

/// @title Total supply never exceeds max total supply
invariant totalSupplyBounded {
    assert _totalSupply <= _maxTotalSupply,
        "total supply must never exceed max total supply";
}
