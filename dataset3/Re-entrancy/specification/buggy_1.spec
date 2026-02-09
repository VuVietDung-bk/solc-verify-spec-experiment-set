variables {
    mapping (address => uint) balances_re_ent8;
    mapping (address => uint) balances_re_ent31;
    mapping (address => uint) userBalance_re_ent26;
    mapping (address => uint) redeemableEther_re_ent32;
    uint256 counter_re_ent7;
    address lastPlayer_re_ent23;
    uint jackpot_re_ent23;
    bool not_called_re_ent13;
}

rule callme_re_ent7_nonreentrant() {
    require counter_re_ent7 <= 5;
    uint counter_before = counter_re_ent7;
    uint contract_before = contract.balance;

    callme_re_ent7();

    uint counter_after = counter_re_ent7;
    uint contract_after = contract.balance;

    assert counter_after == counter_before + 1,
        "counter must increment by exactly 1";
    assert contract_before >= contract_after && contract_before - contract_after <= 10,
        "contract must not send more than 10 ether per call";
}

rule buyTicket_re_ent23_nonreentrant() {
    address player_before = lastPlayer_re_ent23;
    uint contract_before = contract.balance;

    buyTicket_re_ent23();

    address player_after = lastPlayer_re_ent23;
    uint jackpot_after = jackpot_re_ent23;
    uint contract_after = contract.balance;

    assert player_after == msg.sender,
        "caller must become the last player";
    assert player_before == msg.sender || contract_before >= contract_after,
        "contract must send to previous player before updating state";
}

rule withdraw_balances_re_ent8_nonreentrant() {
    require balances_re_ent8[msg.sender] > 0;
    uint user_before = balances_re_ent8[msg.sender];
    uint contract_before = contract.balance;

    withdraw_balances_re_ent8();

    uint user_after = balances_re_ent8[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == 0,
        "user balance must be zeroed after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than user balance";
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
        "contract must not send more than requested in one withdraw";
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
