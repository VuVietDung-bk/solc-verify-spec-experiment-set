// Unchecked-Send specification for TokenERC20 (buggy_5.sol)

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
