rule sendToWinner_unchk8_reverts_without_balance() {
    sendToWinner_unchk8();
    assert_revert;
}
