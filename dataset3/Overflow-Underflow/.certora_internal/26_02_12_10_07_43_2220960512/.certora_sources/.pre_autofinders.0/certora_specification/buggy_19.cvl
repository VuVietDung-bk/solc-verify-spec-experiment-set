// Overflow-Underflow specification for ethBank (buggy_19.sol)

rule transfer_undrflow2_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou2[e.msg.sender] == 0;

    transfer_undrflow2@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}

rule increaseLockTime_intou1_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou1[e.msg.sender];

    increaseLockTime_intou1(e, inc);

    uint afterTime = currentContract.lockTime_intou1[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
