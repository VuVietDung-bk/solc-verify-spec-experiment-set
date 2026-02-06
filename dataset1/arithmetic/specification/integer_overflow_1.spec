variables
{
    uint sellerBalance;
}

rule add_no_overflow(uint value) {
    uint beforeBal = sellerBalance;
    add(value);
    uint afterBal = sellerBalance;
    assert afterBal == beforeBal + value;
}
