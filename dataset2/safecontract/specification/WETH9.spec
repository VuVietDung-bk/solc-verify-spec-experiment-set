variables {
    mapping(address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) allowance;
}

rule depositIncreasesBalance() {
    uint256 userBefore = balanceOf[msg.sender];
    uint256 contractBefore = contract.balance;
    uint256 valueSent = msg.value;

    deposit();

    uint256 userAfter = balanceOf[msg.sender];
    uint256 contractAfter = contract.balance;

    assert userAfter == userBefore + valueSent;
    assert contractAfter == contractBefore + valueSent;
}

rule withdrawDecreasesBalance(uint256 wad) {
    uint256 userBefore = balanceOf[msg.sender];
    uint256 contractBefore = contract.balance;

    withdraw(wad);

    uint256 userAfter = balanceOf[msg.sender];
    uint256 contractAfter = contract.balance;

    assert userAfter == userBefore - wad;
    assert contractAfter == contractBefore - wad;
}

rule transferFromRespectsAllowance(address src, address dst, uint256 wad) {
    uint256 srcBefore = balanceOf[src];
    uint256 dstBefore = balanceOf[dst];
    uint256 allowanceBefore = allowance[src][msg.sender];

    transferFrom(src, dst, wad);

    uint256 srcAfter = balanceOf[src];
    uint256 dstAfter = balanceOf[dst];
    uint256 allowanceAfter = allowance[src][msg.sender];

    assert dst != src => srcAfter == srcBefore - wad;
    assert dst != src => dstAfter == dstBefore + wad;
    assert dst == src => srcAfter == srcBefore;
    assert dst == src => dstAfter == dstBefore;

    assert (src != msg.sender && allowanceBefore != max_uint) => (allowanceAfter == allowanceBefore - wad);
    assert (src == msg.sender || allowanceBefore == max_uint) => (allowanceAfter == allowanceBefore);
}

invariant ethBackedSupply {
    assert contract.balance == balanceOf.sum;
}
