rule cash_unchk46_reverts_without_balance(address winner) {
    cash_unchk46(0, 0, winner);
    assert_revert;
}
