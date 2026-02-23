variables {
    mapping (address => uint) balances_re_ent1;
}

rule withdraw_balances_re_ent1_nonreentrant() {
    require balances_re_ent1[msg.sender] > 0;
    uint user_before = balances_re_ent1[msg.sender];
    uint contract_before = contract.balance;

    withdraw_balances_re_ent1();

    uint user_after = balances_re_ent1[msg.sender];
    uint contract_after = contract.balance;

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
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
