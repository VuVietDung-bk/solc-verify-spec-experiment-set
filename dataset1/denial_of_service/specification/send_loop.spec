variables
{
    mapping (address => uint) refunds;
    address[] refundAddresses;
}

rule refund_all_preserves_refunds(address a) {
    uint beforeRefund = refunds[a];
    refundAll();
    uint afterRefund = refunds[a];
    assert afterRefund == beforeRefund;
}
