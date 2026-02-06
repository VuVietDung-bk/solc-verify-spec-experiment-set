variables
{
    uint pastBlockTime;
}

rule fallback_single_bet() {
    fallback();
    assert true;
}
