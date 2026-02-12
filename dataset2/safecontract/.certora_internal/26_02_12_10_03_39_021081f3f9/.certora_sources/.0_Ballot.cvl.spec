methods {
    function giveRightToVote(address) external;
    function delegate(address) external;
    function vote(uint256) external;
}

/// @title giveRightToVote sets weight to 1
rule giveRightSetsUnitWeight(env e, address voter) {
    require currentContract.voters[voter].voted == false;
    require currentContract.voters[voter].weight == 0;

    giveRightToVote(e, voter);

    assert currentContract.voters[voter].weight == 1;
    assert currentContract.voters[voter].voted == false;
}

/// @title delegate transfers weight to delegatee
rule delegateAddsWeight(env e, address to) {
    require currentContract.voters[e.msg.sender].voted == false;
    require to != e.msg.sender;
    require currentContract.voters[to].voted == false;

    uint256 senderWeightBefore = currentContract.voters[e.msg.sender].weight;
    uint256 delegateWeightBefore = currentContract.voters[to].weight;

    delegate(e, to);

    assert currentContract.voters[e.msg.sender].voted == true;
    assert currentContract.voters[e.msg.sender].delegate == to;
    assert currentContract.voters[to].weight == delegateWeightBefore + senderWeightBefore;
}

/// @title vote accumulates voter weight into proposal count
rule voteAccumulatesWeight(env e, uint256 proposal) {
    require currentContract.voters[e.msg.sender].voted == false;

    uint256 senderWeight = currentContract.voters[e.msg.sender].weight;
    uint256 countBefore = currentContract.proposals[proposal].voteCount;

    vote(e, proposal);

    assert currentContract.voters[e.msg.sender].voted == true;
    assert currentContract.voters[e.msg.sender].vote == proposal;
    assert currentContract.proposals[proposal].voteCount == countBefore + senderWeight;
}
