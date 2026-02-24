// Re-entrancy specification for TokenERC20 (buggy_5.sol)

rule withdrawBalance_re_ent12_nonreentrant() {
    env e;
    require currentContract.userBalance_re_ent12[e.msg.sender] > 0;
    uint owed = currentContract.userBalance_re_ent12[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawBalance_re_ent12(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.userBalance_re_ent12[e.msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule bug_re_ent41_nonreentrant() {
    env e;
    require currentContract.not_called_re_ent41 == true;
    uint contract_before = nativeBalances[currentContract];

    bug_re_ent41(e);

    bool flag_after = currentContract.not_called_re_ent41;
    uint contract_after = nativeBalances[currentContract];

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}

rule callme_re_ent42_nonreentrant() {
    env e;
    require currentContract.counter_re_ent42 <= 5;
    uint counter_before = currentContract.counter_re_ent42;
    uint contract_before = nativeBalances[currentContract];

    callme_re_ent42(e);

    uint counter_after = currentContract.counter_re_ent42;
    uint contract_after = nativeBalances[currentContract];

    assert counter_after == counter_before + 1,
        "counter must increment by exactly 1";
    assert contract_before >= contract_after && contract_before - contract_after <= 10,
        "contract must not send more than 10 ether per call";
}

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

rule withdrawFunds_re_ent31_nonreentrant(uint256 amount) {
    env e;
    require currentContract.balances_re_ent31[e.msg.sender] >= amount;
    uint user_before = currentContract.balances_re_ent31[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawFunds_re_ent31(e, amount);

    uint user_after = currentContract.balances_re_ent31[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested";
}
