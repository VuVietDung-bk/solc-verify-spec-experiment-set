// Re-entrancy specification for owned (buggy_19.sol)

// Re-entrancy specification for ethBank (buggy_19.sol)

rule withdraw_balances_re_ent1_nonreentrant() {
    env e;
    require currentContract.balances_re_ent1[e.msg.sender] > 0;
    uint user_before = currentContract.balances_re_ent1[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdraw_balances_re_ent1(e);

    uint user_after = currentContract.balances_re_ent1[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}

rule bug_re_ent41_nonreentrant() {
    env e;
    require currentContract.not_called_re_ent41 == true;
    uint contract_before = nativeBalances[currentContract];

    bug_re_ent41(e);

    bool flag_after = currentContract.not_called_re_ent41;
    uint contract_after = nativeBalances[currentContract];

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}

rule callme_re_ent42_nonreentrant() {
    env e;
    require currentContract.counter_re_ent42 <= 5;
    uint counter_before = currentContract.counter_re_ent42;
    uint contract_before = nativeBalances[currentContract];

    callme_re_ent42(e);

    uint counter_after = currentContract.counter_re_ent42;
    uint contract_after = nativeBalances[currentContract];

    assert counter_after == counter_before + 1,
        "counter must increment by exactly 1";
    assert contract_before >= contract_after && contract_before - contract_after <= 10,
        "contract must not send more than 10 ether per call";
}
