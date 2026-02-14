variables
{
    mapping (address => uint256) _balances;
    mapping (address => mapping (address => uint256)) _allowed;
    uint256 _totalSupply;
}

rule balance_query_safe() {
    address s;
    uint v;
    s = msg.sender;
    v = 5;
    approve(s, v);
    assert _allowed[s][s] == v;
}
