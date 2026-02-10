methods {
    function retrieve(address, uint256) external;
}

/// @title Only staking contract can call retrieve
rule retrieve_from_non_staking_reverts(env e, address staker, uint256 amount) {
    require e.msg.sender != currentContract.staking;

    retrieve@withrevert(e, staker, amount);

    assert lastReverted;
}
