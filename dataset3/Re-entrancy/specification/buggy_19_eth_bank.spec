variables {
    mapping (address => uint) balances_re_ent17;
    mapping (address => uint) balances_re_ent3;
    mapping (address => uint) redeemableEther_re_ent25;
    mapping (address => uint) userBalance_re_ent19;
    mapping (address => uint) userBalance_re_ent26;
    mapping (address => uint) balances_re_ent36;
}

rule buyTicket_re_ent2_nonreentrant() {
    address player_before = lastPlayer_re_ent2;
    uint contract_before = contract.balance;

    buyTicket_re_ent2();

    address player_after = lastPlayer_re_ent2;
    uint jackpot_after = jackpot_re_ent2;
    uint contract_after = contract.balance;

    assert player_after == msg.sender,
        "caller must become the last player";
    assert player_before == msg.sender || contract_before >= contract_after,
        "contract must send to previous player before updating state";
}

rule withdrawFunds_re_ent17_nonreentrant(uint256 amount) {
    require balances_re_ent17[msg.sender] >= amount;
    uint user_before = balances_re_ent17[msg.sender];
    uint contract_before = contract.balance;

    withdrawFunds_re_ent17(amount);

    uint user_after = balances_re_ent17[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}

rule withdrawFunds_re_ent3_nonreentrant(uint256 amount) {
    require balances_re_ent3[msg.sender] >= amount;
    uint user_before = balances_re_ent3[msg.sender];
    uint contract_before = contract.balance;

    withdrawFunds_re_ent3(amount);

    uint user_after = balances_re_ent3[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
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
        "reward entry must be cleared after claim";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded reward";
}

rule withdrawBalance_re_ent19_nonreentrant() {
    require userBalance_re_ent19[msg.sender] > 0;
    uint owed = userBalance_re_ent19[msg.sender];
    uint contract_before = contract.balance;

    withdrawBalance_re_ent19();

    uint contract_after = contract.balance;

    assert userBalance_re_ent19[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdrawBalance_re_ent26_nonreentrant() {
    require userBalance_re_ent26[msg.sender] > 0;
    uint owed = userBalance_re_ent26[msg.sender];
    uint contract_before = contract.balance;

    withdrawBalance_re_ent26();

    uint contract_after = contract.balance;

    assert userBalance_re_ent26[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule withdraw_balances_re_ent36_nonreentrant() {
    require balances_re_ent36[msg.sender] > 0;
    uint user_before = balances_re_ent36[msg.sender];
    uint contract_before = contract.balance;

    withdraw_balances_re_ent36();

    uint user_after = balances_re_ent36[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule bug_re_ent13_nonreentrant() {
    require not_called_re_ent13 == true;
    uint contract_before = contract.balance;

    bug_re_ent13();

    bool flag_after = not_called_re_ent13;
    uint contract_after = contract.balance;

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}
