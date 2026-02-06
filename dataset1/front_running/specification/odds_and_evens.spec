variables
{
    uint8 tot;
    address owner;
}

invariant tot_bound {
    assert tot <= 2;
}

rule play_increments_tot(uint n) {
    require tot < 2;
    require n == 1;
    play(n);
    assert tot > 0;
}
