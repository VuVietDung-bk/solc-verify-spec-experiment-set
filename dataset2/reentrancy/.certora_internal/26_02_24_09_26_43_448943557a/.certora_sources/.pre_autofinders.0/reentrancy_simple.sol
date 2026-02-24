/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/reentrancy/Reentrancy.sol
 * @author: -
 * @vulnerable_at_lines: 24
 */

 pragma solidity >=0.7.0;

 contract Reentrance {
     mapping (address => uint) userBalance;

     function getBalance(address u) public view returns(uint) {
         return userBalance[u];
     }

     function addToBalance() public payable {
         userBalance[msg.sender] += msg.value;
     }

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
