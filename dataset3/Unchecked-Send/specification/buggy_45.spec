variables
{
    address owner;
    address oracle;
    uint256 bet;
    uint256 initialPrice;
    uint256 finalPrice;
    uint result;
    uint256 splitJackpot;
}

/// @title Only owner can set oracle
rule onlyOwnerCanSetOracle(address _oracle) {
    require msg.sender != owner;

    setOracle(_oracle);

    assert false, "non-owner should not be able to set oracle";
}

/// @title SetOracle updates oracle address
rule setOracleUpdatesOracle(address _oracle) {
    require msg.sender == owner;

    setOracle(_oracle);

    assert oracle == _oracle, "oracle address must be updated";
}

/// @title Only oracle can set initial price
rule onlyOracleCanSetInitialPrice(uint256 value) {
    require msg.sender != oracle;

    setInitialPrice(value);

    assert false, "non-oracle should not be able to set initial price";
}

/// @title SetInitialPrice updates initial price
rule setInitialPriceUpdatesPrice(uint256 value) {
    require msg.sender == oracle;

    setInitialPrice(value);

    assert initialPrice == value, "initial price must be updated";
}

/// @title Only owner can close game
rule onlyOwnerCanCloseGame() {
    require msg.sender != owner;

    closeGame();

    assert false, "non-owner should not be able to close game";
}

/// @title Only oracle can set final price
rule onlyOracleCanSetFinalPrice(uint256 value) {
    require msg.sender != oracle;

    setFinalPrice(value);

    assert false, "non-oracle should not be able to set final price";
}

/// @title SetFinalPrice updates final price
rule setFinalPriceUpdatesPrice(uint256 value) {
    require msg.sender == oracle;

    setFinalPrice(value);

    assert finalPrice == value, "final price must be updated";
}
