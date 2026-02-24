// CVL Spec for Reentrancy_bonus - Reentrancy vulnerability
// claimedBonus set to true AFTER withdrawReward call
// Note: userBalances, claimedBonus, rewardsForA are private mappings

methods {
    function getFirstWithdrawalBonus(address) external;
    function withdrawReward(address) external;
}

/**
 * Rule: bonus_cannot_be_claimed_twice
 * Calling getFirstWithdrawalBonus twice for the same recipient should revert the second time.
 */
rule bonus_cannot_be_claimed_twice(env e1, env e2, address recipient) {
    getFirstWithdrawalBonus(e1, recipient);
    
    getFirstWithdrawalBonus@withrevert(e2, recipient);
    
    assert lastReverted;
}

/**
 * Rule: withdrawReward_does_not_revert
 * withdrawReward should not revert for any recipient.
 */
rule withdrawReward_no_revert(env e, address recipient) {
    withdrawReward@withrevert(e, recipient);
    
    assert !lastReverted;
}
