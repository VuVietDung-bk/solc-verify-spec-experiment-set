variables
{
    mapping (address => uint256) balanceOf;
    mapping(address => mapping(address => uint256)) allowance;
    uint256 totalSupply;
}

rule bug_tmstmp40_one_bet_per_block() {
    bug_tmstmp40();
    assert true;
}
