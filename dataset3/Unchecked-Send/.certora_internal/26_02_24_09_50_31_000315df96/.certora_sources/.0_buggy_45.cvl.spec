/*
 * CVL Specification for buggy_45 - Betting Game Contract
 */

methods {
    function setOracle(address) external;
    function setInitialPrice(uint256) external;
    function setFinalPrice(uint256) external;
    function closeGame() external;
    function owner() external returns (address) envfree;
    function oracle() external returns (address) envfree;
    function initialPrice() external returns (uint256) envfree;
    function finalPrice() external returns (uint256) envfree;
    function bet() external returns (uint256) envfree;
    function result() external returns (uint) envfree;
}

/// @title Only owner can set oracle
rule onlyOwnerCanSetOracle(address _oracle) {
    env e;
    
    require e.msg.sender != owner();

    setOracle@withrevert(e, _oracle);

    assert lastReverted, "non-owner should not be able to set oracle";
}

/// @title SetOracle updates oracle address
rule setOracleUpdatesOracle(address _oracle) {
    env e;
    
    require e.msg.sender == owner();

    setOracle(e, _oracle);

    assert oracle() == _oracle, "oracle address must be updated";
}

/// @title Only oracle can set initial price
rule onlyOracleCanSetInitialPrice(uint256 value) {
    env e;
    
    require e.msg.sender != oracle();

    setInitialPrice@withrevert(e, value);

    assert lastReverted, "non-oracle should not be able to set initial price";
}

/// @title SetInitialPrice updates initial price
rule setInitialPriceUpdatesPrice(uint256 value) {
    env e;
    
    require e.msg.sender == oracle();

    setInitialPrice(e, value);

    assert initialPrice() == value, "initial price must be updated";
}

/// @title Only owner can close game
rule onlyOwnerCanCloseGame() {
    env e;
    
    require e.msg.sender != owner();

    closeGame@withrevert(e);

    assert lastReverted, "non-owner should not be able to close game";
}

/// @title Only oracle can set final price
rule onlyOracleCanSetFinalPrice(uint256 value) {
    env e;
    
    require e.msg.sender != oracle();

    setFinalPrice@withrevert(e, value);

    assert lastReverted, "non-oracle should not be able to set final price";
}

/// @title SetFinalPrice updates final price
rule setFinalPriceUpdatesPrice(uint256 value) {
    env e;
    
    require e.msg.sender == oracle();

    setFinalPrice(e, value);

    assert finalPrice() == value, "final price must be updated";
}
