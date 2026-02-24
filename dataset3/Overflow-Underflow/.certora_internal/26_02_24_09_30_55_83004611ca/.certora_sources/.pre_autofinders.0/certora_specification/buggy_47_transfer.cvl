// Overflow-Underflow specification for AcunarToken (buggy_47.sol)

rule transfer_intou18_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou18[e.msg.sender] == 0;

    transfer_intou18@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}
