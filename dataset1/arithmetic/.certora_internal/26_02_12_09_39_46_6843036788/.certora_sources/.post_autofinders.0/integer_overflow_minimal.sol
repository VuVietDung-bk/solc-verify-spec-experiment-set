/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_minimal.sol
 * @author: -
 * @vulnerable_at_lines: 17
 */

//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage

pragma solidity >=0.7.0;

contract IntegerOverflowMinimal {
    uint public count = 1;

    function run(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, input) }
        // <yes> <report> ARITHMETIC
        count -= input;
    }
}
