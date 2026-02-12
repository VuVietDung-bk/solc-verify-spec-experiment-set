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

     constructor() {
         creator = msg.sender;
     }

     function deposit() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
         require(balances[msg.sender] + msg.value > balances[msg.sender]);
         balances[msg.sender] += msg.value;
     }

     function withdraw(uint256 amount) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036000, amount) }
         require(amount <= balances[msg.sender]);
         payable(msg.sender).transfer(amount);
         balances[msg.sender] -= amount;
     }

     function refund() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
         // <yes> <report> ACCESS_CONTROL
         payable(msg.sender).transfer(balances[msg.sender]);
     }

     // In an emergency the owner can migrate  allfunds to a different address.

     function migrateTo(address to) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, to) }
         require(creator == msg.sender);
         payable(to).transfer(address(this).balance);
     }

 }
