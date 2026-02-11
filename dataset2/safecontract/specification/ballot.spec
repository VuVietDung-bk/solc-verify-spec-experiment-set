variables {
    address chairperson;
    mapping(uint => Proposal) proposals;
    mapping(address => Voter) voters;
}

rule giveRightSetsUnitWeight(address voter) {
    require voters[voter].voted == false;
    require voters[voter].weight == 0;

    giveRightToVote(voter);

    assert voters[voter].weight == 1;
    assert voters[voter].voted == false;
}

rule delegateAddsWeight(address to) {
    require voters[msg.sender].voted == false;
    require to != msg.sender;
    require voters[to].voted == false;

    uint senderWeightBefore = voters[msg.sender].weight;
    uint delegateWeightBefore = voters[to].weight;

    delegate(to);

    assert voters[msg.sender].voted == true;
    assert voters[msg.sender].delegate == to;
    assert voters[to].weight == delegateWeightBefore + senderWeightBefore;
}

rule voteAccumulatesWeight(uint proposal) {
    require voters[msg.sender].voted == false;

    uint senderWeight = voters[msg.sender].weight;
    uint countBefore = proposals[proposal].voteCount;

    vote(proposal);

    assert voters[msg.sender].voted == true;
    assert voters[msg.sender].vote == proposal;
    assert proposals[proposal].voteCount == countBefore + senderWeight;
}
