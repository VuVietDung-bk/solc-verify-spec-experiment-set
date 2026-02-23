variables
{
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    uint supply;
    address founder;
    address admin;
    address deposit;
    uint tokenPrice;
    uint hardCap;
    uint raisedAmount;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address to, uint tokens) {
    uint balance_sender_before = balances[msg.sender];
    uint balance_recip_before = balances[to];

    transfer(to, tokens);

    uint balance_sender_after = balances[msg.sender];
    uint balance_recip_after = balances[to];

    assert to != msg.sender => balance_sender_after == balance_sender_before - tokens,
        "transfer must decrease sender's balance by tokens";

    assert to != msg.sender => balance_recip_after == balance_recip_before + tokens,
        "transfer must increase recipient's balance by tokens";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint tokens) {
    uint balance_from_before = balances[from];
    uint balance_to_before = balances[to];

    transferFrom(from, to, tokens);

    uint balance_from_after = balances[from];
    uint balance_to_after = balances[to];

    assert from != to => balance_from_after == balance_from_before - tokens,
        "transferFrom must decrease source balance by tokens";

    assert from != to => balance_to_after == balance_to_before + tokens,
        "transferFrom must increase destination balance by tokens";
}

/// @title Only admin can halt IEO
rule onlyAdminCanHalt() {
    require msg.sender != admin;

    halt();

    assert false, "non-admin should not be able to halt IEO";
}

/// @title Only admin can unhalt IEO
rule onlyAdminCanUnhalt() {
    require msg.sender != admin;

    unhalt();

    assert false, "non-admin should not be able to unhalt IEO";
}

/// @title Only admin can change deposit address
rule onlyAdminCanChangeDepositAddress(address newDeposit) {
    require msg.sender != admin;

    changeDepositAddress(newDeposit);

    assert false, "non-admin should not be able to change deposit address";
}

/// @title ChangeDepositAddress updates deposit
rule changeDepositAddressUpdatesDeposit(address newDeposit) {
    require msg.sender == admin;

    changeDepositAddress(newDeposit);

    assert deposit == newDeposit, "deposit address must be updated";
}

/// @title Raised amount never exceeds hard cap
invariant raisedAmountBounded {
    assert raisedAmount <= hardCap,
        "raised amount must never exceed hard cap";
}
