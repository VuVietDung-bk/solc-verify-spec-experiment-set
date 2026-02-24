// Unchecked-Send specification for ethBank (buggy_19.sol)

/// @title Only owner can call withdrawForUser
rule onlyOwnerCanWithdrawForUser(address _address, uint amount) {
    env e;
    
    require e.msg.sender != owner();

    withdrawForUser@withrevert(e, _address, amount);

    assert lastReverted, "non-owner should not be able to call withdrawForUser";
}

/// @title Only owner can call moveBrick
rule onlyOwnerCanMoveBrick(uint amount) {
    env e;
    
    require e.msg.sender != owner();

    moveBrick@withrevert(e, amount);

    assert lastReverted, "non-owner should not be able to call moveBrick";
}

/// @title Only owner can call moveBrickContracts
rule onlyOwnerCanMoveBrickContracts() {
    env e;
    
    require e.msg.sender != owner();

    moveBrickContracts@withrevert(e);

    assert lastReverted, "non-owner should not be able to call moveBrickContracts";
}

/// @title Only owner can call joinFlexible
rule onlyOwnerCanJoinFlexible() {
    env e;
    
    require e.msg.sender != owner();

    joinFlexible@withrevert(e);

    assert lastReverted, "non-owner should not be able to call joinFlexible";
}
