variables
{
    mapping (address => uint8) stakes;
    uint8 maxStake;
    address leadInvestor;
}

rule total_stake_callable() {
    getTotalStake();
    assert true;
}
