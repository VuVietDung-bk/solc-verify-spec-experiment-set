methods {
    function callAddress(address) external;
}

/// @title Unchecked low-level call should revert on failure
rule callAddress_should_succeed(env e, address target) {
    callAddress@withrevert(e, target);

    assert lastReverted;
}
