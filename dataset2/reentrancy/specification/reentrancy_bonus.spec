// Spec for Reentrancy_bonus - Reentrancy vulnerability
// claimedBonus set to true AFTER withdrawReward call

variables {
    mapping(address => uint) userBalances;
    mapping(address => bool) claimedBonus;
    mapping(address => uint) rewardsForA;
}

/**
 * Rule: bonus_only_once
 * After claiming bonus, claimedBonus must be true.
 */
rule getFirstWithdrawalBonus_sets_claimed(address recipient) {
    require claimedBonus[recipient] == false;
    
    getFirstWithdrawalBonus(recipient);
    
    assert claimedBonus[recipient] == true;
}

/**
 * Rule: withdrawReward_clears_rewards
 * After withdrawing reward, rewardsForA must be 0.
 */
rule withdrawReward_clears_rewards(address recipient) {
    withdrawReward(recipient);
    
    assert rewardsForA[recipient] == 0;
}
