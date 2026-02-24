// Unchecked-Send specification for RampInstantEthPool (buggy_20.sol)

methods {
    function owner() external returns (address) envfree;
}

/// @title Only owner can withdraw funds
rule onlyOwnerCanWithdrawFunds(address to, uint256 amount) {
    env e;
    
    require e.msg.sender != owner();

    withdrawFunds@withrevert(e, to, amount);

    assert lastReverted, "non-owner should not be able to withdraw funds";
}
