/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: -
 * @vulnerable_at_lines: 22
 */

//added pragma version
pragma solidity >=0.7.0;
 
 contract TimeLock {

     mapping(address => uint) public balances;
     mapping(address => uint) public lockTime;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) lockTime[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
     function deposit() public payable {
         balances[msg.sender] += msg.value;
         lockTime[msg.sender] = block.timestamp + 1 weeks;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) lockTime[extraVar0] >= 0
    /// @notice precondition _secondsToIncrease >= 0
    /// @notice postcondition lockTime[msg.sender] == __verifier_old_uint(lockTime[msg.sender]) + _secondsToIncrease
     function increaseLockTime(uint _secondsToIncrease) public {
         // <yes> <report> ARITHMETIC
         lockTime[msg.sender] += _secondsToIncrease;
     }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) lockTime[extraVar0] >= 0
     function withdraw() public {
         require(balances[msg.sender] > 0);
         require(block.timestamp  > lockTime[msg.sender]);
         uint transferValue = balances[msg.sender];
         balances[msg.sender] = 0;
         payable(msg.sender).transfer(transferValue);
     }
 }
