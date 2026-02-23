variables {
    mapping (address => uint) balances_re_ent17;
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
