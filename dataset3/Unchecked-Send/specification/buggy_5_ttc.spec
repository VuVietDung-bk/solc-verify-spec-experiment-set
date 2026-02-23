variables
{
    mapping (address => uint256) balanceOf;
}

/// @title Only owner can freeze accounts
rule onlyOwnerCanFreeze(address target, bool freeze) {
    require msg.sender != owner;

    freezeAccount(target, freeze);

    assert false, "non-owner should not be able to freeze accounts";
}

/// @title Only owner can mint tokens
rule onlyOwnerCanMint(address target, uint256 mintedAmount) {
    require msg.sender != owner;

    mintToken(target, mintedAmount);

    assert false, "non-owner should not be able to mint tokens";
}

/// @title MintToken increases target balance and total supply
rule mintTokenIncreasesBalance(address target, uint256 mintedAmount) {
    require msg.sender == owner;
    uint256 balance_before = balanceOf[target];
    uint256 supply_before = totalSupply;

    mintToken(target, mintedAmount);

    assert balanceOf[target] == balance_before + mintedAmount,
        "mintToken must increase target balance";
    assert totalSupply == supply_before + mintedAmount,
        "mintToken must increase total supply";
}
