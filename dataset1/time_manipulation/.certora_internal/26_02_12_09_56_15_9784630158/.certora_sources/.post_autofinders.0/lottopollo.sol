/*
 * @source: https://github.com/seresistvanandras/EthBench/blob/master/Benchmark/Simple/timestampdependent.sol
 * @author: -
 * @vulnerable_at_lines: 13,27
 */

pragma solidity >=0.7.0;
contract lottopollo {
  address leader;
  uint    timestamp;
  function payOut(uint rand) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, rand) }
    // <yes> <report> TIME MANIPULATION
    if ( rand> 0 && block.timestamp - rand > 24 hours ) {
      payable(msg.sender).transfer(msg.value );

      if (address(this).balance > 0 ) {
        payable(leader).transfer(address(this).balance );
      }
    }
    else if ( msg.value >= 1 ether ) {
      leader = msg.sender;
      timestamp = rand;
    }
  }
  function randomGen() public returns (uint randomNumber) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
      // <yes> <report> TIME MANIPULATION
      return block.timestamp;   
    }
  function draw(uint seed) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, seed) }
    uint randomNumber=randomGen();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,randomNumber)} 
    payOut(randomNumber);
  }
}