// Unhandled-Exceptions specification for ERC20Burnable (buggy_23.sol)

rule UncheckedExternalCall_unchk40_does_not_handle_failure() {
    env e;
    UncheckedExternalCall_unchk40(e);
    assert true, "send() failure is checked but not properly handled";
}

rule sendToWinner_unchk44_ignores_send_failure() {
    env e;
    require currentContract.payedOut_unchk44 == false;
    sendToWinner_unchk44(e);
    assert currentContract.payedOut_unchk44,
        "payedOut flag is set even if send fails";
}
