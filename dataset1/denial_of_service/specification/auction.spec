variables
{
    uint currentBid;
    address currentFrontrunner;
}

invariant bid_nonnegative {
    assert currentBid >= 0;
}

rule bid_must_succeed_if_higher(uint256 val) {
    address user = msg.sender;
    uint256 bid_before = currentBid;
    address frontrunner_before = currentFrontrunner;

    require msg.value > bid_before;
    require user != frontrunner_before;
    require frontrunner_before != address(0);

    bid();

    assert currentBid == msg.value;
    assert currentFrontrunner == user;
}