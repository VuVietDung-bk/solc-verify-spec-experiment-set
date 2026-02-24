// Overflow-Underflow specification for TokenERC20 (buggy_5.sol)

rule transfer_intou10_should_not_underflow(address to, uint value) {
    env e;
    require value > 0;
    require currentContract.balances_intou10[e.msg.sender] == 0;

    transfer_intou10@withrevert(e, to, value);

    assert lastReverted, "transfer with zero balance and positive value should revert";
}
