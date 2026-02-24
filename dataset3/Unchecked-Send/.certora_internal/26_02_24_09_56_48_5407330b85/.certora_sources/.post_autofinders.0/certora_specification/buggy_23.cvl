/*
 * CVL Specification for buggy_23 - ERC20 Token with Burn
 */

methods {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
    function approve(address, uint256) external returns (bool);
    function burn(uint256) external;
    function increaseAllowance(address, uint256) external returns (bool);
    function balanceOf(address) external returns (uint256) envfree;
    function allowance(address, address) external returns (uint256) envfree;
    function totalSupply() external returns (uint256) envfree;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address to, uint256 value) {
    env e;
    
    uint256 balance_sender_before = balanceOf(e.msg.sender);
    uint256 balance_recip_before = balanceOf(to);

    transfer(e, to, value);

    uint256 balance_sender_after = balanceOf(e.msg.sender);
    uint256 balance_recip_after = balanceOf(to);

    assert to != e.msg.sender => balance_sender_after == balance_sender_before - value,
        "transfer must decrease sender's balance by value";

    assert to != e.msg.sender => balance_recip_after == balance_recip_before + value,
        "transfer must increase recipient's balance by value";
    
    assert to == e.msg.sender => balance_sender_after == balance_sender_before,
        "transfer to self must not change balance";
}

/// @title TransferFrom must conserve total balance
rule transferFromConservesBalance(address from, address to, uint256 value) {
    env e;
    
    uint256 balance_from_before = balanceOf(from);
    uint256 balance_to_before = balanceOf(to);

    transferFrom(e, from, to, value);

    uint256 balance_from_after = balanceOf(from);
    uint256 balance_to_after = balanceOf(to);

    assert from != to => balance_from_after == balance_from_before - value,
        "transferFrom must decrease source balance by value";

    assert from != to => balance_to_after == balance_to_before + value,
        "transferFrom must increase destination balance by value";
}

/// @title Burn decreases sender balance and total supply
rule burnDecreasesBalance(uint256 value) {
    env e;
    
    uint256 balance_before = balanceOf(e.msg.sender);
    uint256 supply_before = totalSupply();

    burn(e, value);

    assert balanceOf(e.msg.sender) == balance_before - value,
        "burn must decrease sender balance";
    assert totalSupply() == supply_before - value,
        "burn must decrease total supply";
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
