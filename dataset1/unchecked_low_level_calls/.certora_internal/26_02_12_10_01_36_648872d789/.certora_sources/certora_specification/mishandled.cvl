methods {
    function withdrawBalance() external;
}

/// @title withdrawBalance must reset user balance and debit contract
rule withdrawBalance_must_transfer(env e) {
    require currentContract.userBalances[e.msg.sender] > 0;

    uint256 amount = currentContract.userBalances[e.msg.sender];
    uint256 balBefore = nativeBalances[currentContract];

    withdrawBalance(e);

    uint256 balAfter = nativeBalances[currentContract];
    assert currentContract.userBalances[e.msg.sender] == 0;
    assert balAfter == balBefore - amount;
}
