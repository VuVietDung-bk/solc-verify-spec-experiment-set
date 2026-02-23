/// @title Only owner can transfer ownership
rule onlyOwnerCanTransferOwnership(address newOwner) {
    require msg.sender != owner;

    transferOwnership(newOwner);

    assert false, "non-owner should not be able to transfer ownership";
}

/// @title TransferOwnership updates owner
rule transferOwnershipUpdatesOwner(address newOwner) {
    require msg.sender == owner;
    require newOwner != address(0);

    transferOwnership(newOwner);

    assert owner == newOwner, "ownership must transfer to new owner";
}
