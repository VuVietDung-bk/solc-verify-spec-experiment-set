// Re-entrancy specification for TTC (buggy_5.sol)

rule withdrawFunds_re_ent17_nonreentrant(uint256 amount) {
    env e;
    require currentContract.balances_re_ent17[e.msg.sender] >= amount;
    uint user_before = currentContract.balances_re_ent17[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawFunds_re_ent17(e, amount);

    uint user_after = currentContract.balances_re_ent17[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested";
}

rule bug_re_ent13_nonreentrant() {
    env e;
    require currentContract.not_called_re_ent13 == true;
    uint contract_before = nativeBalances[currentContract];

    bug_re_ent13(e);

    bool flag_after = currentContract.not_called_re_ent13;
    uint contract_after = nativeBalances[currentContract];

    assert flag_after == false,
        "flag must be set to false after call";
    assert contract_before >= contract_after && contract_before - contract_after <= 1,
        "contract must not send more than 1 ether";
}

rule withdraw_balances_re_ent36_nonreentrant() {
    env e;
    require currentContract.balances_re_ent36[e.msg.sender] > 0;
    uint user_before = currentContract.balances_re_ent36[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdraw_balances_re_ent36(e);

    uint user_after = currentContract.balances_re_ent36[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == 0,
        "stored balance must be cleared after withdrawal";
    assert contract_before >= contract_after && contract_before - contract_after <= user_before,
        "contract must not send more than recorded balance";
}
