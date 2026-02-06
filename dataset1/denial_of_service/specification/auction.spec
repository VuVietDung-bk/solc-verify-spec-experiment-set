variables
{
    uint currentBid;
}

invariant bid_nonnegative {
    assert currentBid >= 0;
}
