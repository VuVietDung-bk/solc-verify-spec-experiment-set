variables
{
    address owner;
}

rule go_unchecked() {
    address target = 0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C;
    uint oldContractBalance = contract.balance;
    uint oldTargetBalance = target.balance;
    uint oldOwnerBalance = owner.balance;
    go();
    assert contract.balance == 0;
    assert target.balance == oldTargetBalance + msg.value;
    assert owner.balance == oldOwnerBalance + oldContractBalance - msg.value;
}
