variables
{
    mapping (address => uint) userBalances;
}

rule withdrawBalance_must_transfer() {
    require userBalances[msg.sender] > 0;
    uint amount = userBalances[msg.sender];
    uint balBefore = contract.balance;
    withdrawBalance();
    uint balAfter = contract.balance;
    assert userBalances[msg.sender] == 0;
    assert balAfter == balBefore - amount;
}
