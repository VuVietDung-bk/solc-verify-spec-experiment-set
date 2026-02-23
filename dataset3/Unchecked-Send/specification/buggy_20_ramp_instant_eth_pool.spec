/// @title Only owner can withdraw funds
rule onlyOwnerCanWithdrawFunds(address to, uint256 amount) {
    require msg.sender != owner;

    withdrawFunds(to, amount);

    assert false, "non-owner should not be able to withdraw funds";
}
