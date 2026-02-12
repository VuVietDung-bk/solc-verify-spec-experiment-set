// Overflow-Underflow specification for RampInstantEthPool (buggy_20.sol)

rule transfer_intou10_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou10[e.msg.sender] == 0;

    transfer_intou10@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}

rule increaseLockTime_intou21_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou21[e.msg.sender];

    increaseLockTime_intou21(e, inc);

    uint afterTime = currentContract.lockTime_intou21[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
