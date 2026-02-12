methods {
    function Command(address, bytes) external;
}

/// @title Command must transfer msg.value to destination
rule Command_unchecked(env e, address adr, bytes data) {
    require e.msg.sender == currentContract.Owner;
    require adr != 0;

    uint256 oldContractBalance = nativeBalances[currentContract];
    uint256 oldDstBalance = nativeBalances[adr];

    Command(e, adr, data);

    assert nativeBalances[currentContract] == oldContractBalance - e.msg.value;
    assert nativeBalances[adr] == oldDstBalance + e.msg.value;
}
