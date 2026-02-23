/// @title Only owner can call withdrawForUser
rule onlyOwnerCanWithdrawForUser(address _address, uint amount) {
    require msg.sender != owner;

    withdrawForUser(_address, amount);

    assert false, "non-owner should not be able to call withdrawForUser";
}

/// @title Only owner can call moveBrick
rule onlyOwnerCanMoveBrick(uint amount) {
    require msg.sender != owner;

    moveBrick(amount);

    assert false, "non-owner should not be able to call moveBrick";
}

/// @title Only owner can call moveBrickContracts
rule onlyOwnerCanMoveBrickContracts() {
    require msg.sender != owner;

    moveBrickContracts();

    assert false, "non-owner should not be able to call moveBrickContracts";
}

/// @title Only owner can call joinFlexible
rule onlyOwnerCanJoinFlexible() {
    require msg.sender != owner;

    joinFlexible();

    assert false, "non-owner should not be able to call joinFlexible";
}
