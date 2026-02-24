// CVL Spec for Reentrancy_bonus - Reentrancy vulnerability
// claimedBonus set to true AFTER withdrawReward call

methods {
    function getFirstWithdrawalBonus(address) external;
    function withdrawReward(address) external;
    function userBalances(address) external returns (uint) envfree;
    function claimedBonus(address) external returns (bool) envfree;
    function rewardsForA(address) external returns (uint) envfree;
}

/**
 * Rule: bonus_only_once
 * After claiming bonus, claimedBonus must be true.
 */
rule getFirstWithdrawalBonus_sets_claimed(env e, address recipient) {
    require claimedBonus(recipient) == false;
    
    getFirstWithdrawalBonus(e, recipient);
    
    assert claimedBonus(recipient) == true;
}

/**
 * Rule: withdrawReward_clears_rewards
 * After withdrawing reward, rewardsForA must be 0.
 */
rule withdrawReward_clears_rewards(env e, address recipient) {
    withdrawReward(e, recipient);
    
    assert rewardsForA(recipient) == 0;
}
