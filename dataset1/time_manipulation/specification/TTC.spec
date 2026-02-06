variables
{
    address owner;
    string name;
    string symbol;
    uint8 decimals;
    uint256 totalSupply;
    mapping (address => uint256) balanceOf;
    mapping (address => mapping (address => uint256)) allowance;
}

rule bug_tmstmp32_one_bet_per_block() {
    bug_tmstmp32();
    assert true;
}
