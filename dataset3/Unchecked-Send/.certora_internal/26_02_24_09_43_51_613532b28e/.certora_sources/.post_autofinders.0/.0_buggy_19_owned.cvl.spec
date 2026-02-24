// Unchecked-Send specification for owned (buggy_19.sol)

/// @title Only owner can transfer ownership
rule onlyOwnerCanTransferOwnership(address newOwner) {
    env e;
    
    require e.msg.sender != owner();

    transferOwnership@withrevert(e, newOwner);

    assert lastReverted, "non-owner should not be able to transfer ownership";
}

/// @title TransferOwnership updates owner
rule transferOwnershipUpdatesOwner(address newOwner) {
    env e;
    
    require e.msg.sender == owner();
    require newOwner != 0;

    transferOwnership(e, newOwner);

    assert owner() == newOwner, "ownership must transfer to new owner";
}
