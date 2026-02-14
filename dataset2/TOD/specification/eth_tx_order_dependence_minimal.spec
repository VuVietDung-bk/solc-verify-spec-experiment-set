variables
{
    bool claimed;
    address owner;
    uint reward;
}

rule set_reward_keeps_unclaimed() {
    require claimed == false;
    require msg.sender == owner;
    setReward();
    assert claimed == false;
}

rule claim_marks_claimed(uint submission) {
    require claimed == false;
    require submission < 10;
    claimReward(submission);
    assert claimed == true;
}