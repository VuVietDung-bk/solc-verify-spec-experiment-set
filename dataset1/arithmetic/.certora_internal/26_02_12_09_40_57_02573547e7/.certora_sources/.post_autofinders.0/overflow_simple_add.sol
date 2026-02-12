/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101#overflow-simple-addsol
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;

contract Overflow_Add {
    uint public balance = 1;

    function add(uint256 deposit) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, deposit) }
        // <yes> <report> ARITHMETIC
        balance += deposit;
    }
}
