/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-105#wallet-03-wrong-constructorsol
 * @author: -
 * @vulnerable_at_lines: 19,20
 */

pragma solidity >=0.7.0;

 /* User can add pay in and withdraw Ether.
    The constructor is wrongly named, so anyone can become 'creator' and withdraw all funds.
 */

 contract Wallet {
     address creator;

     mapping(address => uint256) balances;
     
     // <yes> <report> ACCESS_CONTROL
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender != creator
    /// @notice precondition creator != address(0)
    /// @notice postcondition creator != msg.sender
     function initWallet() public {
         creator = msg.sender;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
     function deposit() public payable {
         require(balances[msg.sender] + msg.value > balances[msg.sender]);
         balances[msg.sender] += msg.value;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
     function withdraw(uint256 amount) public {
         require(amount <= balances[msg.sender]);
         payable(msg.sender).transfer(amount);
         balances[msg.sender] -= amount;
     }

     // In an emergency the owner can migrate  allfunds to a different address.

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function migrateTo(address to) public {
         require(creator == msg.sender);
         payable(to).transfer(address(this).balance);
     }

 }
