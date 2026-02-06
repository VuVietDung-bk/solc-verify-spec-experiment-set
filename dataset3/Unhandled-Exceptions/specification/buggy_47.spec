rule cash_unchk34_reverts_without_balance(address payable winner) {
    cash_unchk34(0, 0, winner);
    assert_revert;
}

rule cash_unchk10_reverts_without_balance(address payable winner) {
    cash_unchk10(0, 0, winner);
    assert_revert;
}

rule cash_unchk22_reverts_without_balance(address payable winner) {
    cash_unchk22(0, 0, winner);
    assert_revert;
}

rule cash_unchk46_reverts_without_balance(address payable winner) {
    cash_unchk46(0, 0, winner);
    assert_revert;
}
