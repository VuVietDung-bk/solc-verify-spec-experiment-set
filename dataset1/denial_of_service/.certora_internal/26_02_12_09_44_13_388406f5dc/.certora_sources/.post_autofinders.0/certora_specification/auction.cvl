methods {
    function bid() external;
}

/// @title Current bid is always non-negative (trivially true for uint, but documents intent)
invariant bid_nonnegative()
    currentContract.currentBid >= 0;

/// @title A higher bid must succeed and update frontrunner
rule bid_must_succeed_if_higher(env e) {
    uint256 bid_before = currentContract.currentBid;
    address frontrunner_before = currentContract.currentFrontrunner;

    require e.msg.value > bid_before;
    require e.msg.sender != frontrunner_before;
    require frontrunner_before != 0;

    bid(e);

    assert currentContract.currentBid == e.msg.value;
    assert currentContract.currentFrontrunner == e.msg.sender;
}
