variables {
    mapping (address => uint) balances_re_ent8;
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) userBalance_re_ent40;
    mapping (address => uint) balances_re_ent36;
    mapping (address => uint) userBalance_re_ent33;
    mapping (address => uint) redeemableEther_re_ent39;
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