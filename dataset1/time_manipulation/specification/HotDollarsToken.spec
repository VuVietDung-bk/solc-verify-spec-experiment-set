variables
{
    uint256 totalSupply;
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}

rule bug_tmstmp36_one_bet_per_block() {
    bug_tmstmp36();
    assert true;
}
