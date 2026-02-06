variables
{
    address[] creditorAddresses;
    uint[] creditorAmounts;
    mapping (address => uint) buddies;
}

invariant lengths_match {
    assert creditorAddresses.length == creditorAmounts.length;
}

invariant nonnegative_state {
    assert profitFromCrash >= 0;
    assert lastTimeOfNewCredit >= 0;
    assert lastCreditorPayedOut >= 0;
    assert forall address a. buddies[a] >= 0;
    assert forall uint i. creditorAmounts[i] >= 0;
}
