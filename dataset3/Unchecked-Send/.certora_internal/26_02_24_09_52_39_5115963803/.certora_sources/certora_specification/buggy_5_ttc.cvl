// Unchecked-Send specification for TTC (buggy_5.sol)

methods {
    function owner() external returns (address) envfree;
}

/// @title Only owner can freeze accounts
rule onlyOwnerCanFreeze(address target, bool freeze) {
    env e;
    
    require e.msg.sender != owner();

    freezeAccount@withrevert(e, target, freeze);

    assert lastReverted, "non-owner should not be able to freeze accounts";
}

/// @title Only owner can mint tokens
rule onlyOwnerCanMint(address target, uint256 mintedAmount) {
    env e;
    
    require e.msg.sender != owner();

    mintToken@withrevert(e, target, mintedAmount);

    assert lastReverted, "non-owner should not be able to mint tokens";
}

/// @title MintToken increases target balance and total supply
rule mintTokenIncreasesBalance(address target, uint256 mintedAmount) {
    env e;
    
    require e.msg.sender == owner();
    uint256 balance_before = balanceOf(target);
    uint256 supply_before = totalSupply();

    mintToken(e, target, mintedAmount);

    assert balanceOf(target) == balance_before + mintedAmount,
        "mintToken must increase target balance";
    assert totalSupply() == supply_before + mintedAmount,
        "mintToken must increase total supply";
}
