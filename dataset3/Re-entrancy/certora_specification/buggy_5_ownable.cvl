// Re-entrancy specification for Ownable (buggy_5.sol)

// Re-entrancy specification for TTC (buggy_5.sol)

rule withdraw_balances_re_ent21_nonreentrant() {
    env e;
    require currentContract.balances_re_ent21[e.msg.sender] > 0;
    uint user_before = currentContract.balances_re_ent21[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdraw_balances_re_ent21(e);

    uint user_after = currentContract.balances_re_ent21[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent40_nonreentrant() {
    env e;
    require currentContract.userBalance_re_ent40[e.msg.sender] > 0;
    uint owed = currentContract.userBalance_re_ent40[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawBalance_re_ent40(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.userBalance_re_ent40[e.msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule buyTicket_re_ent9_nonreentrant() {
    env e;
    address player_before = currentContract.lastPlayer_re_ent9;
    uint contract_before = nativeBalances[currentContract];

    buyTicket_re_ent9(e);

    address player_after = currentContract.lastPlayer_re_ent9;
    uint contract_after = nativeBalances[currentContract];

    assert player_after == e.msg.sender,
        "caller must become the last player";
    assert player_before == e.msg.sender || contract_before >= contract_after,
        "contract must send to previous player before updating state";
}

rule claimReward_re_ent25_nonreentrant() {
    env e;
    require currentContract.redeemableEther_re_ent25[e.msg.sender] > 0;
    uint owed = currentContract.redeemableEther_re_ent25[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    claimReward_re_ent25(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.redeemableEther_re_ent25[e.msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
