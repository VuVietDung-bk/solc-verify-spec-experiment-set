/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 20,27
 */

 pragma solidity >=0.7.0;
 
 contract Lotto {

     bool public payedOut = false;
     address public winner;
     uint public winAmount;

     // ... extra functionality here

     function sendToWinner() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
         require(!payedOut);
         // <yes> <report> UNCHECKED_LL_CALLS
         payable(winner).transfer(winAmount);
         payedOut = true;
     }

     function withdrawLeftOver() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
         require(payedOut);
         // <yes> <report> UNCHECKED_LL_CALLS
         payable(msg.sender).transfer(address(this).balance);
     }
 }
