methods {
    function add(uint256) external;
}

/// @title add must not overflow: result == old + deposit
rule add_no_overflow(env e, uint256 deposit) {
    uint256 beforeBal = currentContract.balance;

    add(e, deposit);

    uint256 afterBal = currentContract.balance;
    assert afterBal == beforeBal + deposit;
}
