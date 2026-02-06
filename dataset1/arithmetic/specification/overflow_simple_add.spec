variables
{
    uint balance;
}

rule add_no_overflow(uint256 deposit) {
    uint beforeBal = balance;
    add(deposit);
    uint afterBal = balance;
    assert afterBal == beforeBal + deposit;
}
