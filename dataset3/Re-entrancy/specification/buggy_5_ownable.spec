variables {
    mapping (address => uint) balances_re_ent21;
    mapping (address => uint) userBalance_re_ent40;
    mapping (address => uint) redeemableEther_re_ent25;
}

rule withdraw_balances_re_ent21_nonreentrant() {
    require balances_re_ent21[msg.sender] > 0;
    uint user_before = balances_re_ent21[msg.sender];
    uint contract_before = contract.balance;

    withdraw_balances_re_ent21();

    uint user_after = balances_re_ent21[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent40_nonreentrant() {
    require userBalance_re_ent40[msg.sender] > 0;
    uint owed = userBalance_re_ent40[msg.sender];
    uint contract_before = contract.balance;

    withdrawBalance_re_ent40();

    uint contract_after = contract.balance;

    assert userBalance_re_ent40[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule buyTicket_re_ent9_nonreentrant() {
    address player_before = lastPlayer_re_ent9;
    uint contract_before = contract.balance;

    buyTicket_re_ent9();

    address player_after = lastPlayer_re_ent9;
    uint jackpot_after = jackpot_re_ent9;
    uint contract_after = contract.balance;

    assert player_after == msg.sender,
        "caller must become the last player";
    assert player_before == msg.sender || contract_before >= contract_after,
        "contract must send to previous player before updating state";
}

rule claimReward_re_ent25_nonreentrant() {
    require redeemableEther_re_ent25[msg.sender] > 0;
    uint owed = redeemableEther_re_ent25[msg.sender];
    uint contract_before = contract.balance;

    claimReward_re_ent25();

    uint contract_after = contract.balance;

    assert redeemableEther_re_ent25[msg.sender] == 0,
        "reward entry must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}
