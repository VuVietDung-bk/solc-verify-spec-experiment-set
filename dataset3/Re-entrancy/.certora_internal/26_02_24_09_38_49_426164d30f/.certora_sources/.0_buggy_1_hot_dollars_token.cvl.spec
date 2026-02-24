// Re-entrancy specification for HotDollarsToken (buggy_1.sol)

rule withdrawBalance_re_ent26_nonreentrant() {
    env e;
    require currentContract.userBalance_re_ent26[e.msg.sender] > 0;
    uint user_before = currentContract.userBalance_re_ent26[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawBalance_re_ent26(e);

    uint user_after = currentContract.userBalance_re_ent26[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == 0,
        "user balance must be zeroed after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than user balance";
}

rule claimReward_re_ent32_nonreentrant() {
    env e;
    require currentContract.redeemableEther_re_ent32[e.msg.sender] > 0;
    uint owed = currentContract.redeemableEther_re_ent32[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    claimReward_re_ent32(e);

    uint contract_after = nativeBalances[currentContract];

    assert currentContract.redeemableEther_re_ent32[e.msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
