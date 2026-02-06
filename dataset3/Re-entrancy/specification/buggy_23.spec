variables {
    mapping (address => uint) balances_re_ent17;
    mapping (address => uint) balances_re_ent3;
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) balances_re_ent38;
    mapping (address => uint) redeemableEther_re_ent25;
    mapping (address => uint) redeemableEther_re_ent32;
    mapping (address => uint) redeemableEther_re_ent4;
    mapping (address => uint) redeemableEther_re_ent39;
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
        "contract must not send more than requested";
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
        "contract must not send more than requested";
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
        "contract must not send more than requested";
}

rule withdrawFunds_re_ent38_nonreentrant(uint256 amount) {
    require balances_re_ent38[msg.sender] >= amount;
    uint user_before = balances_re_ent38[msg.sender];
    uint contract_before = address(this).balance;

    withdrawFunds_re_ent38(amount);

    uint user_after = balances_re_ent38[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested";
}

rule claimReward_re_ent25_nonreentrant() {
    require redeemableEther_re_ent25[msg.sender] > 0;
    uint owed = redeemableEther_re_ent25[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent25();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent25[msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule claimReward_re_ent32_nonreentrant() {
    require redeemableEther_re_ent32[msg.sender] > 0;
    uint owed = redeemableEther_re_ent32[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent32();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent32[msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule claimReward_re_ent4_nonreentrant() {
    require redeemableEther_re_ent4[msg.sender] > 0;
    uint owed = redeemableEther_re_ent4[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent4();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent4[msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule claimReward_re_ent39_nonreentrant() {
    require redeemableEther_re_ent39[msg.sender] > 0;
    uint owed = redeemableEther_re_ent39[msg.sender];
    uint contract_before = address(this).balance;

    claimReward_re_ent39();

    uint contract_after = address(this).balance;

    assert redeemableEther_re_ent39[msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}