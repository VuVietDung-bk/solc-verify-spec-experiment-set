/*
 * @source: https://consensys.github.io/smart-contract-best-practices/known_attacks/
 * @author: consensys
 * @vulnerable_at_lines: 17
 */

pragma solidity >=0.7.0;

contract Reentrancy_insecure {

    // INSECURE
    mapping (address => uint) private userBalances;

    /// @notice precondition forall (address extraVar0) userBalances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition userBalances[msg.sender] == 0
    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        // <yes> <report> REENTRANCY
        (bool success, ) = msg.sender.call{value: amountToWithdraw}(""); // At this point, the caller's code is executed, and can call withdrawBalance again
        require(success);
        userBalances[msg.sender] = 0;
    }
}
