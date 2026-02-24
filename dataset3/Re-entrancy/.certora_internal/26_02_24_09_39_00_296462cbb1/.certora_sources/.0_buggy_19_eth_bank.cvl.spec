// Re-entrancy specification for ethBank (buggy_19.sol)

rule buyTicket_re_ent2_nonreentrant() {
    env e;
    address player_before = currentContract.lastPlayer_re_ent2;
    uint contract_before = nativeBalances[currentContract];

    buyTicket_re_ent2(e);

    address player_after = currentContract.lastPlayer_re_ent2;
    uint contract_after = nativeBalances[currentContract];

    assert player_after == e.msg.sender,
        "caller must become the last player";
    assert player_before == e.msg.sender || contract_before >= contract_after,
        "contract must send to previous player before updating state";
}

rule withdrawFunds_re_ent17_nonreentrant(uint256 amount) {
    env e;
    require currentContract.balances_re_ent17[e.msg.sender] >= amount;
    uint user_before = currentContract.balances_re_ent17[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawFunds_re_ent17(e, amount);

    uint user_after = currentContract.balances_re_ent17[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}

rule withdrawFunds_re_ent3_nonreentrant(uint256 amount) {
    env e;
    require currentContract.balances_re_ent3[e.msg.sender] >= amount;
    uint user_before = currentContract.balances_re_ent3[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawFunds_re_ent3(e, amount);

    uint user_after = currentContract.balances_re_ent3[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
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
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule withdrawBalance_re_ent19_nonreentrant() {
    env e;
    require currentContract.userBalance_re_ent19[e.msg.sender] > 0;
    uint owed = currentContract.userBalance_re_ent19[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawBalance_re_ent19(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.userBalance_re_ent19[e.msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent26_nonreentrant() {
    env e;
    require currentContract.userBalance_re_ent26[e.msg.sender] > 0;
    uint owed = currentContract.userBalance_re_ent26[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawBalance_re_ent26(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.userBalance_re_ent26[e.msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdraw_balances_re_ent36_nonreentrant() {
    env e;
    require currentContract.balances_re_ent36[e.msg.sender] > 0;
    uint user_before = currentContract.balances_re_ent36[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdraw_balances_re_ent36(e);

    uint user_after = currentContract.balances_re_ent36[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule bug_re_ent13_nonreentrant() {
    env e;
    require currentContract.not_called_re_ent13 == true;
    uint contract_before = nativeBalances[currentContract];

    bug_re_ent13(e);

    bool flag_after = currentContract.not_called_re_ent13;
    uint contract_after = nativeBalances[currentContract];

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}
