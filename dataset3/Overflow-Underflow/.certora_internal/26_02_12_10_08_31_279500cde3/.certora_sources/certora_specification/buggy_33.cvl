// Overflow-Underflow specification for Staking (buggy_33.sol)

rule transfer_undrflow2_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou38[e.msg.sender] == 0;

    transfer_intou38@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}

rule increaseLockTime_intou33_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou17[e.msg.sender];

    increaseLockTime_intou17(e, inc);

    uint afterTime = currentContract.lockTime_intou17[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
