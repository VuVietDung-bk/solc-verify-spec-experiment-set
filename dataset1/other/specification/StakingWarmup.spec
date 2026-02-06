variables
{
    address staking;
    address sMYNOS;
}

rule retrieve_only_staking() {
    require msg.sender == staking;
    retrieve(msg.sender, 1);
    assert true;
}
