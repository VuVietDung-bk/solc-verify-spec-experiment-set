/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-105#wallet-04-confused-signsol
 * @author: -
 * @vulnerable_at_lines: 30
 */

pragma solidity >=0.7.0;

 /* User can add pay in and withdraw Ether.
    Unfortunatelty, the developer was drunk and used the wrong comparison operator in "withdraw()"
    Anybody can withdraw arbitrary amounts of Ether :()
 */

 contract Wallet {
     address creator;

     mapping(address => uint256) balances;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
     constructor() {
         creator = msg.sender;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
     function deposit() public payable {
         assert(balances[msg.sender] + msg.value > balances[msg.sender]);
         balances[msg.sender] += msg.value;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition amount >= 0
    /// @notice precondition amount <= balances[msg.sender]
    /// @notice postcondition balances[msg.sender] == __verifier_old_uint(balances[msg.sender]) - amount
     function withdraw(uint256 amount) public {
         // <yes> <report> ACCESS_CONTROL
         require(amount >= balances[msg.sender]);
         payable(msg.sender).transfer(amount);
         balances[msg.sender] -= amount;
     }

     // In an emergency the owner can migrate  allfunds to a different address.
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
     function migrateTo(address to) public {
         require(creator == msg.sender);
         payable(to).transfer(address(this).balance);
     }

 }
