// Overflow-Underflow specification for owned (buggy_19.sol)

rule increaseLockTime_intou1_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou1[e.msg.sender];

    increaseLockTime_intou1(e, inc);

    uint afterTime = currentContract.lockTime_intou1[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
