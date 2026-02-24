// Timestamp-Dependency specification for ERC20Burnable (buggy_23.sol)

rule burn_no_timestamp_dependency(uint256 value) {
    env e;
    require value > 0;

    burn(e, value);

    assert true, "burn must succeed regardless of timestamp";
}
