// Overflow-Underflow specification for LollypopToken (buggy_34.sol)

rule transfer_intou34_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou34[e.msg.sender] == 0;

    transfer_intou34@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}
