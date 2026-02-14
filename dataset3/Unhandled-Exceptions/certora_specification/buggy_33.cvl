// Unhandled-Exceptions specification for Staking (buggy_33.sol)

rule cash_unchk46_reverts_without_balance(address winner) {
    env e;
    cash_unchk46@withrevert(e, 0, 0, winner);
    assert lastReverted;
}
