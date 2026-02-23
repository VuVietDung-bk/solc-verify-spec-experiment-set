/*
 * @source: https://consensys.github.io/smart-contract-best-practices/known_attacks/
 * @author: consensys
 * @vulnerable_at_lines: 28
 */

pragma solidity >=0.7.0;

contract Reentrancy_bonus{

    // INSECURE
    mapping (address => uint) private userBalances;
    mapping (address => bool) private claimedBonus;
    mapping (address => uint) private rewardsForA;

    /// @notice precondition forall (address extraVar0) userBalances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) rewardsForA[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition rewardsForA[recipient] == 0
    function withdrawReward(address recipient) public {
        uint amountToWithdraw = rewardsForA[recipient];
        rewardsForA[recipient] = 0;
        (bool success, ) = recipient.call{value: amountToWithdraw}("");
        require(success);
    }

    /// @notice precondition forall (address extraVar0) userBalances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) rewardsForA[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function getFirstWithdrawalBonus(address recipient) public {
        require(!claimedBonus[recipient]); // Each recipient should only be able to claim the bonus once

        rewardsForA[recipient] += 100;
        // <yes> <report> REENTRANCY
        withdrawReward(recipient); // At this point, the caller will be able to execute getFirstWithdrawalBonus again.
        claimedBonus[recipient] = true;
    }
}
