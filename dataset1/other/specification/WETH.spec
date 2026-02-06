variables
{
    mapping (address => uint256) balanceOf;
    mapping (address => mapping (address => uint256)) allowance;
}

rule total_supply_callable() {
    totalSupply();
    assert true;
}
