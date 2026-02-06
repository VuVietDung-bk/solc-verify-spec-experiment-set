variables
{
    string name;
    string symbol;
    uint256 decimals;
    uint256 totalSupply;
    bool second;
    mapping (address => uint256) balanceOf;
    mapping (address => mapping (address => uint256)) allowance;
}

rule transfer_from_sets_second(address from, address to, uint value) {
    require second == false;
    require allowance[from][msg.sender] >= value;
    require balanceOf[from] >= value;
    transferFrom(from, to, value);
    assert second == true;
}
