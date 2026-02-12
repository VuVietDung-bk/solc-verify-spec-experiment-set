methods {
    function setReward() external;
    function claimReward(uint256) external;
}

/// @title setReward by owner does not mark as claimed
rule set_reward_keeps_unclaimed(env e) {
    require currentContract.claimed == false;
    require e.msg.sender == currentContract.owner;

    setReward(e);

    assert currentContract.claimed == false;
}

/// @title claimReward with valid submission marks claimed
rule claim_marks_claimed(env e, uint256 submission) {
    require currentContract.claimed == false;
    require submission < 10;

    claimReward(e, submission);

    assert currentContract.claimed == true;
}
