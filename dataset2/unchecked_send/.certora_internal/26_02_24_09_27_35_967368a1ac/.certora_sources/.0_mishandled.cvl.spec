// CVL Spec for SendBack (mishandled.sol) - Unchecked send vulnerability
// send() return value not checked

methods {
    function withdrawBalance() external;
    function userBalances(address) external returns (uint) envfree;
}

/**
 * Rule: withdrawBalance_sets_balance_zero
 * After withdrawal, user balance must be 0.
 */
rule withdrawBalance_sets_balance_zero(env e) {
    withdrawBalance(e);
    
    assert userBalances(e.msg.sender) == 0;
}
