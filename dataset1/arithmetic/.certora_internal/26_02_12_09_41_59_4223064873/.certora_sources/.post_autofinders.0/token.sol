/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: Steve Marx
 * @vulnerable_at_lines: 20,22
 */

 pragma solidity >=0.7.0;

 contract Token {

   mapping(address => uint) balances;
   uint public totalSupply;

   constructor(uint _initialSupply) {
     balances[msg.sender] = totalSupply = _initialSupply;
   }

   function transfer(address _to, uint _value) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, _value) }
     // <yes> <report> ARITHMETIC
     require(balances[msg.sender] - _value >= 0);
     // <yes> <report> ARITHMETIC
     balances[msg.sender] -= _value;
     balances[_to] += _value;
     return true;
   }

   function balanceOf(address _owner) public returns (uint balance) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, _owner) }
     return balances[_owner];
   }
 }
