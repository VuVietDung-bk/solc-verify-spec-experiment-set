methods {
    function Command(address, bytes) external;
}

/// @title Command must debit contract balance by msg.value
rule Command_unchecked(env e, address adr, bytes data) {
    require e.msg.sender == currentContract.Owner;

    uint256 balBefore = nativeBalances[currentContract];

    Command(e, adr, data);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - e.msg.value;
}
