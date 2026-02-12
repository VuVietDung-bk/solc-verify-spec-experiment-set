// Overflow-Underflow specification for AcunarIEO (buggy_47.sol)

rule transfer_intou18_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou18[e.msg.sender] == 0;

    transfer_intou18@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}

rule increaseLockTime_intou17_monotonic(uint inc) {
    env e;
    uint before = currentContract.lockTime_intou17[e.msg.sender];

    increaseLockTime_intou17(e, inc);

    uint afterTime = currentContract.lockTime_intou17[e.msg.sender];
    assert afterTime > before, "lock time must strictly increase";
}
