variables
{
    mapping (uint256 => uint256) map;
}

rule init_underflow_should_revert(uint256 k, uint256 v) {
    require v > map[k];
    uint256 beforeVal = map[k];
    init(k, v);
    uint256 afterVal = map[k];
    assert afterVal == beforeVal - v;
}
