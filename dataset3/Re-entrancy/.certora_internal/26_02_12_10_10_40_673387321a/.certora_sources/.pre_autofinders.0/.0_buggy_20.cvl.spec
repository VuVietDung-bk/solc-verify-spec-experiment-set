// Re-entrancy specification for RampInstantEthPool (buggy_20.sol)

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

rule claimReward_re_ent11_nonreentrant() {
    env e;
    require currentContract.redeemableEther_re_ent11[e.msg.sender] > 0;
    uint owed = currentContract.redeemableEther_re_ent11[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    claimReward_re_ent11(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.redeemableEther_re_ent11[e.msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
