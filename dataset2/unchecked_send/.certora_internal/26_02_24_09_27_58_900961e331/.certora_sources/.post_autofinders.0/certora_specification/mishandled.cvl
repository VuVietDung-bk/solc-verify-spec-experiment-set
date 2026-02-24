// CVL Spec for SendBack (mishandled.sol) - Unchecked send vulnerability
// send() return value not checked
// Note: userBalances is internal mapping

methods {
    function withdrawBalance() external;
}

/**
 * Rule: withdrawBalance_does_not_revert
 * withdrawBalance should not revert.
 */
rule withdrawBalance_no_revert(env e) {
    withdrawBalance@withrevert(e);
    
    assert !lastReverted;
}
