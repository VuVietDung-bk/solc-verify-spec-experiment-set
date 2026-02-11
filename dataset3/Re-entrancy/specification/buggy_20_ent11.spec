variables {
    mapping (address => uint) redeemableEther_re_ent11;
}
rule claimReward_re_ent11_nonreentrant() {
    require redeemableEther_re_ent11[msg.sender] > 0;
    uint owed = redeemableEther_re_ent11[msg.sender];
    uint contract_before = contract.balance;
    claimReward_re_ent11();
    uint contract_after = contract.balance;
    assert redeemableEther_re_ent11[msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
            "contract must not send more than recorded reward";
}
