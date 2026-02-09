variables
{
    address staking;
    address sMYNOS;
}

rule retrieve_from_non_staking_reverts(address staker, uint amount) {
    require msg.sender != staking;
    retrieve(staker, amount);
    assert_revert;
}
