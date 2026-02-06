variables
{
    mapping (address => uint256) balances;
}

rule batch_transfer_debits_full_amount(address[] receivers, uint256 value) {
    require receivers.length > 0;
    uint256 beforeBal = balances[msg.sender];
    batchTransfer(receivers, value);
    uint256 afterBal = balances[msg.sender];
    uint256 len = receivers.length;
    assert afterBal == beforeBal - len * value;
}
