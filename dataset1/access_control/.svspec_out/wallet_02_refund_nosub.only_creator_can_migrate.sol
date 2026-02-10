/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-105#wallet-02-refund-nosubsol
 * @author: -
 * @vulnerable_at_lines: 36
 */

pragma solidity >=0.7.0;

 /* User can add pay in and withdraw Ether.
    Unfortunately the developer forgot set the user's balance to 0 when refund() is called.
    An attacker can pay in a small amount of Ether and call refund() repeatedly to empty the contract.
 */

 contract Wallet {
     address creator;

     mapping(address => uint256) balances;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     constructor() {
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

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     function refund() public {
         // <yes> <report> ACCESS_CONTROL
         payable(msg.sender).transfer(balances[msg.sender]);
     }

     // In an emergency the owner can migrate  allfunds to a different address.

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender != creator
    /// @notice postcondition false
     function migrateTo(address to) public {
         require(creator == msg.sender);
         payable(to).transfer(address(this).balance);
     }

 }
