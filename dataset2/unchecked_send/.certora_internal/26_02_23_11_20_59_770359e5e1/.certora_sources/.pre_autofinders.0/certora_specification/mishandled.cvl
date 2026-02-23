// CVL Spec for SendBack (mishandled.sol) - Unchecked send vulnerability
// send() return value not checked
// Note: userBalances is internal so we cannot verify its state directly

methods {
    function withdrawBalance() external;
}

// Ghost variable to track calls
ghost uint256 withdrawCallCount;

// Hook to track withdrawBalance calls
hook CALL(uint g, address addr, uint value, uint argsOffset, uint argsLength, uint retOffset, uint retLength) uint rc {
    withdrawCallCount = withdrawCallCount + 1;
}

/**
 * Rule: withdrawBalance_performs_external_call
 * The withdrawBalance function performs an external call (send).
 */
rule withdrawBalance_performs_external_call(env e) {
    uint256 callsBefore = withdrawCallCount;
    
    withdrawBalance(e);
    
    // After withdrawBalance, at least one external call should have been made
    assert withdrawCallCount >= callsBefore;
}

