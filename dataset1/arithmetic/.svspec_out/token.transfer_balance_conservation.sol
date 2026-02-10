/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: Steve Marx
 * @vulnerable_at_lines: 20,22
 */

pragma solidity >=0.7.0;

 contract Token {

   mapping(address => uint) balances;
   uint public totalSupply;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _initialSupply >= 0
   constructor(uint _initialSupply) {
     balances[msg.sender] = totalSupply = _initialSupply;
   }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    /// @notice precondition _to != msg.sender
    /// @notice postcondition __verifier_old_uint(balances[msg.sender]) >= _value
    /// @notice postcondition balances[msg.sender] == __verifier_old_uint(balances[msg.sender]) - _value
    /// @notice postcondition balances[_to] == __verifier_old_uint(balances[_to]) + _value
   function transfer(address _to, uint _value) public returns (bool) {
     // <yes> <report> ARITHMETIC
     require(balances[msg.sender] - _value >= 0);
     // <yes> <report> ARITHMETIC
     balances[msg.sender] -= _value;
     balances[_to] += _value;
     return true;
   }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
   function balanceOf(address _owner) public returns (uint balance) {
     return balances[_owner];
   }
 }
