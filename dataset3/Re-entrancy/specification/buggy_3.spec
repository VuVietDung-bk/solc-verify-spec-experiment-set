variables {
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) balances_re_ent38;
    mapping (address => uint) balances_re_ent8;
    mapping (address => uint) balances_re_ent36;
    mapping (address => uint) userBalance_re_ent19;
    mapping (address => uint) userBalance_re_ent26;
    mapping (address => uint) userBalance_re_ent40;
    mapping (address => uint) userBalance_re_ent33;
    mapping (address => uint) redeemableEther_re_ent25;
    mapping (address => uint) redeemableEther_re_ent32;
    mapping (address => uint) redeemableEther_re_ent4;
    mapping (address => uint) redeemableEther_re_ent39;
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

rule withdrawBalance_re_ent19_nonreentrant() {
    require userBalance_re_ent19[msg.sender] > 0;
    uint owed = userBalance_re_ent19[msg.sender];
    uint contract_before = address(this).balance;

    withdrawBalance_re_ent19();

    uint contract_after = address(this).balance;

    assert userBalance_re_ent19[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent26_nonreentrant() {
    require userBalance_re_ent26[msg.sender] > 0;
    uint owed = userBalance_re_ent26[msg.sender];
    uint contract_before = address(this).balance;

    withdrawBalance_re_ent26();

    uint contract_after = address(this).balance;

    assert userBalance_re_ent26[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
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

rule withdraw_balances_re_ent8_nonreentrant() {
    require balances_re_ent8[msg.sender] > 0;
    uint user_before = balances_re_ent8[msg.sender];
    uint contract_before = address(this).balance;

    withdraw_balances_re_ent8();

    uint user_after = balances_re_ent8[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after <= user_before,
        "stored balance must not increase";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule withdraw_balances_re_ent36_nonreentrant() {
    require balances_re_ent36[msg.sender] > 0;
    uint user_before = balances_re_ent36[msg.sender];
    uint contract_before = address(this).balance;

    withdraw_balances_re_ent36();

    uint user_after = balances_re_ent36[msg.sender];
    uint contract_after = address(this).balance;

    assert user_after <= user_before,
        "stored balance must not increase";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent40_nonreentrant() {
    require userBalance_re_ent40[msg.sender] > 0;
    uint owed = userBalance_re_ent40[msg.sender];
    uint contract_before = address(this).balance;

    withdrawBalance_re_ent40();

    uint contract_after = address(this).balance;

    assert userBalance_re_ent40[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent33_nonreentrant() {
    require userBalance_re_ent33[msg.sender] > 0;
    uint owed = userBalance_re_ent33[msg.sender];
    uint contract_before = address(this).balance;

    withdrawBalance_re_ent33();

    uint contract_after = address(this).balance;

    assert userBalance_re_ent33[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
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