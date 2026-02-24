/*
 * CVL Specification for buggy_47 - IEO Token Contract
 */

methods {
    function transfer(address, uint) external returns (bool);
    function transferFrom(address, address, uint) external returns (bool);
    function halt() external;
    function unhalt() external;
    function changeDepositAddress(address) external;
    function balanceOf(address) external returns (uint) envfree;
    function allowance(address, address) external returns (uint) envfree;
    function totalSupply() external returns (uint) envfree;
    function founder() external returns (address) envfree;
    function admin() external returns (address) envfree;
    function deposit() external returns (address) envfree;
    function hardCap() external returns (uint256) envfree;
    function raisedAmount() external returns (uint256) envfree;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address to, uint tokens) {
    env e;
    
    uint balance_sender_before = balanceOf(e.msg.sender);
    uint balance_recip_before = balanceOf(to);

    transfer(e, to, tokens);

    uint balance_sender_after = balanceOf(e.msg.sender);
    uint balance_recip_after = balanceOf(to);

    assert to != e.msg.sender => balance_sender_after == balance_sender_before - tokens,
        "transfer must decrease sender's balance by tokens";

    assert to != e.msg.sender => balance_recip_after == balance_recip_before + tokens,
        "transfer must increase recipient's balance by tokens";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint tokens) {
    env e;
    
    uint balance_from_before = balanceOf(from);
    uint balance_to_before = balanceOf(to);

    transferFrom(e, from, to, tokens);

    uint balance_from_after = balanceOf(from);
    uint balance_to_after = balanceOf(to);

    assert from != to => balance_from_after == balance_from_before - tokens,
        "transferFrom must decrease source balance by tokens";

    assert from != to => balance_to_after == balance_to_before + tokens,
        "transferFrom must increase destination balance by tokens";
}

/// @title Only admin can halt IEO
rule onlyAdminCanHalt() {
    env e;
    
    require e.msg.sender != admin();

    halt@withrevert(e);

    assert lastReverted, "non-admin should not be able to halt IEO";
}

/// @title Only admin can unhalt IEO
rule onlyAdminCanUnhalt() {
    env e;
    
    require e.msg.sender != admin();

    unhalt@withrevert(e);

    assert lastReverted, "non-admin should not be able to unhalt IEO";
}

/// @title Only admin can change deposit address
rule onlyAdminCanChangeDepositAddress(address newDeposit) {
    env e;
    
    require e.msg.sender != admin();

    changeDepositAddress@withrevert(e, newDeposit);

    assert lastReverted, "non-admin should not be able to change deposit address";
}

/// @title ChangeDepositAddress updates deposit
rule changeDepositAddressUpdatesDeposit(address newDeposit) {
    env e;
    
    require e.msg.sender == admin();

    changeDepositAddress(e, newDeposit);

    assert deposit() == newDeposit, "deposit address must be updated";
}

/// @title Raised amount never exceeds hard cap
invariant raisedAmountBounded()
    raisedAmount() <= hardCap()
    { preserved { require true; } }
