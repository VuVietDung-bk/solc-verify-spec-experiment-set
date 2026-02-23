variables {
    mapping (address => uint) userBalance_re_ent26;
    mapping (address => uint) redeemableEther_re_ent32;
}

rule withdrawBalance_re_ent26_nonreentrant() {
    require userBalance_re_ent26[msg.sender] > 0;
    uint user_before = userBalance_re_ent26[msg.sender];
    uint contract_before = contract.balance;

    withdrawBalance_re_ent26();

    uint user_after = userBalance_re_ent26[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == 0,
        "user balance must be zeroed after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than user balance";
}

rule claimReward_re_ent32_nonreentrant() {
    require redeemableEther_re_ent32[msg.sender] > 0;
    uint owed = redeemableEther_re_ent32[msg.sender];
    uint contract_before = contract.balance;

    claimReward_re_ent32();

    uint contract_after = contract.balance;

    assert redeemableEther_re_ent32[msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
