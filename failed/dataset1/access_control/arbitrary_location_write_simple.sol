/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-124#arbitrary-location-write-simplesol
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 27
 */

 pragma solidity >=0.7.0;

 contract Wallet {
     uint[] private bonusCodes;
     address private owner;

     constructor() {
         bonusCodes = new uint[](0);
         owner = msg.sender;
     }

     receive() external payable {
     }

     function PushBonusCode(uint c) public {
         bonusCodes.push(c);
     }

     function PopBonusCode() public {
         // <yes> <report> ACCESS_CONTROL
         require(0 <= bonusCodes.length); // this condition is always true since array lengths are unsigned
         bonusCodes.pop(); // an underflow can be caused here
     }

     function UpdateBonusCodeAt(uint idx, uint c) public {
         require(idx < bonusCodes.length);
         bonusCodes[idx] = c; // write to any index less than bonusCodes.length
     }

     function Destroy() public {
         require(msg.sender == owner);
         selfdestruct(payable(owner));
     }
 }
