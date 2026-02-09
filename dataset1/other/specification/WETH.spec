variables
{
    mapping (address => uint256) balanceOf;
}

rule withdrawTo_cannot_exceed_balance(uint wad) {
    require wad > 0;
    require balanceOf[msg.sender] >= wad;

    uint beforeBal = balanceOf[msg.sender];
    withdrawTo(payable(address(0xBEEF)), wad);
    uint afterBal = balanceOf[msg.sender];

    // Wrapped balance should decrease by the withdrawn amount.
    assert afterBal == beforeBal - wad;
}
