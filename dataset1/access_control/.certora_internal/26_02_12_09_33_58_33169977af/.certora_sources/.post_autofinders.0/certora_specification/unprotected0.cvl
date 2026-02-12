methods {
    function changeOwner(address) external;
}

/// @title Only current owner should be able to change the owner
rule change_owner_requires_owner(env e, address newOwner) {
    address oldOwner = currentContract.owner;
    require oldOwner != 0;
    require e.msg.sender != oldOwner;

    changeOwner(e, newOwner);

    assert currentContract.owner == oldOwner,
        "Vulnerability: non-owner can change the owner";
}
