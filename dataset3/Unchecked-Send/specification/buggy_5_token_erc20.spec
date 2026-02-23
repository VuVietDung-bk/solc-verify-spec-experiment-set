variables
{
    mapping (address => uint256) balanceOf;
}

/// @title Transfer must conserve total balance between sender and recipient
rule transferConservesBalance(address to, uint256 value) {
    uint256 balance_sender_before = balanceOf[msg.sender];
    uint256 balance_recip_before = balanceOf[to];

    transfer(to, value);

    uint256 balance_sender_after = balanceOf[msg.sender];
    uint256 balance_recip_after = balanceOf[to];

    assert to != msg.sender => balance_sender_after == balance_sender_before - value,
        "transfer must decrease sender's balance by value";

    assert to != msg.sender => balance_recip_after == balance_recip_before + value,
        "transfer must increase recipient's balance by value";
}

/// @title Burn decreases sender balance and total supply
rule burnDecreasesBalance(uint256 value) {
    uint256 balance_before = balanceOf[msg.sender];
    uint256 supply_before = totalSupply;

    burn(value);

    assert balanceOf[msg.sender] == balance_before - value,
        "burn must decrease sender balance";
    assert totalSupply == supply_before - value,
        "burn must decrease total supply";
}
