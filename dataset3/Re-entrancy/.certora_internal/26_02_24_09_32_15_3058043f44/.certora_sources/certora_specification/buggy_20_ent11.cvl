// Re-entrancy specification for Stoppable (buggy_20.sol) - claimReward_re_ent11

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
