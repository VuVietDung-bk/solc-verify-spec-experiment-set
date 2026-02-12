methods {
    function refundAll() external;
}

/// @title refundAll sends each user their refund amount
rule refund_all_preserves_refunds(env e, uint256 i) {
    require i < currentContract.refundAddresses.length;

    address recipient = currentContract.refundAddresses[i];
    uint256 beforeRefund = currentContract.refunds[recipient];
    uint256 balanceBefore = nativeBalances[recipient];

    refundAll(e);

    uint256 afterRefund = currentContract.refunds[recipient];
    assert afterRefund == beforeRefund;
    assert nativeBalances[recipient] == balanceBefore + beforeRefund;
}
