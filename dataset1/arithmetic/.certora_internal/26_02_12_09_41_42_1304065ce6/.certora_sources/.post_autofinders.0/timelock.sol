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

     function deposit() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
         balances[msg.sender] += msg.value;
         lockTime[msg.sender] = block.timestamp + 1 weeks;
     }

     function increaseLockTime(uint _secondsToIncrease) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, _secondsToIncrease) }
         // <yes> <report> ARITHMETIC
         lockTime[msg.sender] += _secondsToIncrease;
     }

     function withdraw() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
         require(balances[msg.sender] > 0);
         require(block.timestamp  > lockTime[msg.sender]);
         uint transferValue = balances[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,transferValue)}
         balances[msg.sender] = 0;
         payable(msg.sender).transfer(transferValue);
     }
 }
