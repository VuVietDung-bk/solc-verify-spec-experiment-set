// Overflow-Underflow specification for Ownable (buggy_5.sol)

rule increaseLockTime_intou21_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou21[e.msg.sender];

    increaseLockTime_intou21(e, inc);

    uint afterTime = currentContract.lockTime_intou21[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
