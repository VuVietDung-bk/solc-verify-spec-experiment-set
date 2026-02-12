methods {
    function withdrawTo(address, uint256) external;
}

/// @title withdrawTo decreases balance by exact amount
rule withdrawTo_cannot_exceed_balance(env e, uint256 wad) {
    require wad > 0;
    require currentContract.balanceOf[e.msg.sender] >= wad;

    uint256 beforeBal = currentContract.balanceOf[e.msg.sender];

    withdrawTo(e, 0xBEEF, wad);

    uint256 afterBal = currentContract.balanceOf[e.msg.sender];
    assert afterBal == beforeBal - wad;
}
