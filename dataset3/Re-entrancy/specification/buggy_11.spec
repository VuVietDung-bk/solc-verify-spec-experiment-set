variables {
    mapping (address => uint) balances_re_ent3;
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) balances_re_ent17;
    mapping (address => uint) redeemableEther_re_ent25;
    mapping (address => uint) redeemableEther_re_ent11;
}

rule withdrawFunds_re_ent3_nonreentrant(uint256 amount) {
    require balances_re_ent3[msg.sender] >= amount;
    uint user_before = balances_re_ent3[msg.sender];
    uint contract_before = address(this).balance;

    withdrawFunds_re_ent3(amount);

    uint user_after = balances_re_ent3[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}

rule withdrawFunds_re_ent31_nonreentrant(uint256 amount) {
    require balances_re_ent31[msg.sender] >= amount;
    uint user_before = balances_re_ent31[msg.sender];
    uint contract_before = address(this).balance;

    withdrawFunds_re_ent31(amount);

    uint user_after = balances_re_ent31[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}

rule withdrawFunds_re_ent17_nonreentrant(uint256 amount) {
    require balances_re_ent17[msg.sender] >= amount;
    uint user_before = balances_re_ent17[msg.sender];
    uint contract_before = address(this).balance;

    withdrawFunds_re_ent17(amount);

    uint user_after = balances_re_ent17[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}

rule claimReward_re_ent25_nonreentrant() {
    require redeemableEther_re_ent25[msg.sender] > 0;
    uint owed = redeemableEther_re_ent25[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent25();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent25[msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule claimReward_re_ent11_nonreentrant() {
    require redeemableEther_re_ent11[msg.sender] > 0;
    uint owed = redeemableEther_re_ent11[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent11();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent11[msg.sender] == 0,
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
