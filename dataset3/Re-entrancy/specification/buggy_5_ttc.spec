variables {
    mapping (address => uint) balances_re_ent17;
    mapping (address => uint) balances_re_ent36;
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
