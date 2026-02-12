// Overflow-Underflow specification for HotDollarsToken (buggy_1.sol)

rule transfer_intou14_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou14[e.msg.sender] == 0;

    transfer_intou14@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}

rule increaseLockTime_intou13_should_not_overflow(uint delta) {
    env e;
    uint before = currentContract.lockTime_intou13[e.msg.sender];

    increaseLockTime_intou13(e, delta);

    uint afterTime = currentContract.lockTime_intou13[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase after adding delta";
}
