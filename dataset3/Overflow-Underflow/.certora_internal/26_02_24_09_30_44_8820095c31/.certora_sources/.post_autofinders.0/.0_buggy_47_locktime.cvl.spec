// Overflow-Underflow specification for ERC20Interface (buggy_47.sol)

rule increaseLockTime_intou17_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou17[e.msg.sender];

    increaseLockTime_intou17(e, inc);

    uint afterTime = currentContract.lockTime_intou17[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
