// Re-entrancy specification for Stoppable (buggy_20.sol) - withdrawFunds_re_ent3

rule withdrawFunds_re_ent3_nonreentrant(uint256 amount) {
    env e;
    require currentContract.balances_re_ent3[e.msg.sender] >= amount;
    uint user_before = currentContract.balances_re_ent3[e.msg.sender];
    uint contract_before = nativeBalances[currentContract];

    withdrawFunds_re_ent3(e, amount);

    uint user_after = currentContract.balances_re_ent3[e.msg.sender];
    uint contract_after = nativeBalances[currentContract];

    assert user_after == user_before - amount,
        "caller balance should drop exactly by amount";
    assert contract_before >= contract_after && contract_before - contract_after <= amount,
        "contract must not send more than requested in one withdraw";
}
