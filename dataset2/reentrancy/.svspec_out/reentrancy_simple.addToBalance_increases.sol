/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/reentrancy/Reentrancy.sol
 * @author: -
 * @vulnerable_at_lines: 24
 */

pragma solidity >=0.7.0;

 contract Reentrance {
     mapping (address => uint) userBalance;

    /// @notice precondition forall (address extraVar0) userBalance[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function getBalance(address u) public view returns(uint) {
         return userBalance[u];
     }

    /// @notice precondition forall (address extraVar0) userBalance[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice postcondition userBalance[msg.sender] == __verifier_old_uint(userBalance[msg.sender]) + msg.value
     function addToBalance() public payable {
         userBalance[msg.sender] += msg.value;
     }

    /// @notice precondition forall (address extraVar0) userBalance[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function withdrawBalance()public {
         // send userBalance[msg.sender] ethers to msg.sender
         // if mgs.sender is a contract, it will call its fallback function
         // <yes> <report> REENTRANCY
         (bool success, ) = msg.sender.call{value: userBalance[msg.sender]}("");
         if( !success ){
             revert();
         }
         userBalance[msg.sender] = 0;
     }
 }
