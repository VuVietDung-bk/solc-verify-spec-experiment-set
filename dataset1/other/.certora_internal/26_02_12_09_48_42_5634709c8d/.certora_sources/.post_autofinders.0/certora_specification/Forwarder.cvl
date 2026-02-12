methods {
    function forward(address, bytes) external;
}

/// @title Only owner can call forward
rule non_owner_forward_reverts(env e, address to, bytes data) {
    require e.msg.sender != currentContract.owner;

    forward@withrevert(e, to, data);

    assert lastReverted;
}
