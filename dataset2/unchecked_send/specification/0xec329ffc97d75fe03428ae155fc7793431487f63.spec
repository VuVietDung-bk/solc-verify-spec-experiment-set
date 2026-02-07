variables
{
    address owner;
}

rule execute_unchecked(address dst, uint value, bytes data) {
    require msg.sender == owner;
    require dst != address(0);
    require value <= contract.balance;
    uint oldContractBalance = contract.balance;
    uint oldDstBalance = dst.balance;
    execute(dst, value, data);
    assert contract.balance == oldContractBalance - value;
    assert dst.balance == oldDstBalance + value;
}
