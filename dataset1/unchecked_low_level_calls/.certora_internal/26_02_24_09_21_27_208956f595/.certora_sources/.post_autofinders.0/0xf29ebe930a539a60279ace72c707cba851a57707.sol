/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 16
 */

pragma solidity >=0.7.0;


contract B {
    address public owner = msg.sender;
    
    function go() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        address target = 0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,target)}
        // <yes> <report> UNCHECKED_LL_CALLS
        target.call{value: msg.value}("");
        payable(owner).transfer(address(this).balance);
    }
    
    receive() external payable {
    }
}