variables {
    mapping (address => uint) balances_re_ent21;
    mapping (address => uint) userBalance_re_ent40;
    address lastPlayer_re_ent9;
    uint jackpot_re_ent9;
    mapping (address => uint) redeemableEther_re_ent25;
    mapping (address => uint) userBalance_re_ent12;
    bool not_called_re_ent41;
    uint256 counter_re_ent42;
    address lastPlayer_re_ent2;
    uint jackpot_re_ent2;
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) balances_re_ent17;
    bool not_called_re_ent13;
    mapping (address => uint) balances_re_ent36;
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

rule withdrawBalance_re_ent12_nonreentrant() {
    require userBalance_re_ent12[msg.sender] > 0;
    uint owed = userBalance_re_ent12[msg.sender];
    uint contract_before = contract.balance;

    withdrawBalance_re_ent12();

    uint contract_after = contract.balance;

    assert userBalance_re_ent12[msg.sender] == 0,
        "recorded balance must be cleared";
    assert contract_before >= contract_after && contract_before - contract_after <= owed,
        "contract must not send more than recorded balance";
}

rule bug_re_ent41_nonreentrant() {
    require not_called_re_ent41 == true;
    uint contract_before = contract.balance;

    bug_re_ent41();

    bool flag_after = not_called_re_ent41;
    uint contract_after = contract.balance;

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}

rule callme_re_ent42_nonreentrant() {
    require counter_re_ent42 <= 5;
    uint counter_before = counter_re_ent42;
    uint contract_before = contract.balance;

    callme_re_ent42();

    uint counter_after = counter_re_ent42;
    uint contract_after = contract.balance;

    assert counter_after == counter_before + 1,
        "counter must increment by exactly 1";
    assert contract_before >= contract_after && contract_before - contract_after <= 10,
        "contract must not send more than 10 ether per call";
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

rule withdrawFunds_re_ent31_nonreentrant(uint256 amount) {
    require balances_re_ent31[msg.sender] >= amount;
    uint user_before = balances_re_ent31[msg.sender];
    uint contract_before = contract.balance;

    withdrawFunds_re_ent31(amount);

    uint user_after = balances_re_ent31[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested";
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
        "contract must not send more than requested";
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