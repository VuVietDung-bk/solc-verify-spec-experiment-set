/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 20,27
 */

pragma solidity >=0.7.0;
 
 contract Lotto {

     bool public payedOut = false;
     address public winner;
     uint public winAmount;

     // ... extra functionality here

    /// @notice precondition winAmount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function sendToWinner() public {
         require(!payedOut);
         // <yes> <report> UNCHECKED_LL_CALLS
         payable(winner).send(winAmount);
         payedOut = true;
     }

    /// @notice precondition winAmount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition payedOut == true
    /// @notice postcondition payedOut == true
     function withdrawLeftOver() public {
         require(payedOut);
         // <yes> <report> UNCHECKED_LL_CALLS
         payable(msg.sender).send(address(this).balance);
     }
 }
