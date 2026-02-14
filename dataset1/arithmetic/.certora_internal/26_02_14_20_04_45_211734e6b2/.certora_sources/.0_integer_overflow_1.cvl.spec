methods {
    function add(uint256) external;
}

/// @title add must not overflow: result == old + value
rule add_no_overflow(env e, uint256 value) {
    uint256 beforeBal = currentContract.sellerBalance;

    add(e, value);

    uint256 afterBal = currentContract.sellerBalance;
    assert afterBal == beforeBal + value;
}
