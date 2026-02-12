methods {
    function go() external;
}

/// @title go must correctly distribute: contract drained, target gets msg.value, owner gets rest
rule go_unchecked(env e) {
    uint256 oldContractBalance = nativeBalances[currentContract];
    address target = 0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C;
    uint256 oldTargetBalance = nativeBalances[target];
    uint256 oldOwnerBalance = nativeBalances[currentContract.owner];

    go(e);

    assert nativeBalances[currentContract] == 0;
    assert nativeBalances[target] == oldTargetBalance + e.msg.value;
    assert nativeBalances[currentContract.owner] == oldOwnerBalance + oldContractBalance - e.msg.value;
}
