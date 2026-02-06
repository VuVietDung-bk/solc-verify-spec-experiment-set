variables
{
    address lastSecretSanta;
    uint lastPresentAt;
    uint prizeDelay;
    bool isPrizeClaimed;
}

rule claimPrize_sets_flag() {
    require msg.sender == lastSecretSanta;
    require block.timestamp > lastPresentAt + prizeDelay;
    claimPrize();
    assert isPrizeClaimed == true;
}
