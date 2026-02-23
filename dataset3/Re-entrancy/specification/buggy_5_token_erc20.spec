variables {
    mapping (address => uint) userBalance_re_ent12;
    mapping (address => uint) balances_re_ent31;
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
