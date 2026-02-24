methods {
    function Command(address, bytes) external;
    function withdraw() external;
    function Owner() external returns (address) envfree;
}

/// @title Command must debit contract balance by msg.value
rule Command_unchecked(env e, address adr, bytes data) {
    require e.msg.sender == currentContract.Owner();

    uint256 balBefore = nativeBalances[currentContract];

    Command(e, adr, data);

    uint256 balAfter = nativeBalances[currentContract];
    assert balAfter == balBefore - e.msg.value;
}

/// @title Only owner can execute Command
rule only_owner_can_Command(env e, address adr, bytes data) {
    require e.msg.sender != currentContract.Owner();

    Command@withrevert(e, adr, data);

    assert lastReverted;
}

/// @title Only owner can withdraw
rule only_owner_can_withdraw(env e) {
    require e.msg.sender != currentContract.Owner();

    withdraw@withrevert(e);

    assert lastReverted;
}
