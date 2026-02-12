/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 12
 */

pragma solidity >=0.7.0;

contract Caller {
    function callAddress(address a) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, a) }
        // <yes> <report> UNCHECKED_LL_CALLS
        a.call("");
    }
}