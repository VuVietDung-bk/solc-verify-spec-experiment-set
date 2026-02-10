variables
{
    mapping (address => uint) refunds;
    mapping (uint => address) refundAddresses;
}

rule refund_all_preserves_refunds(uint i) {
    require i >= 0 && i < refundAddresses.length;
    uint beforeRefund = refunds[refundAddresses[i]];
    uint balanceBefore = refundAddresses[i].balance;
    refundAll();
    uint afterRefund = refunds[refundAddresses[i]];
    assert afterRefund == beforeRefund;
    assert refundAddresses[i].balance == balanceBefore + beforeRefund;
}
