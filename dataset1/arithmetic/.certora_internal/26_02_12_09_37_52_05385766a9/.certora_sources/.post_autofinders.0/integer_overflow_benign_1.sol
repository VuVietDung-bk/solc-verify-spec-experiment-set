/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_benign_1.sol
 * @author: -
 * @vulnerable_at_lines: 17
 */

//Single transaction overflow
//Post-transaction effect: overflow never escapes function

pragma solidity >=0.7.0;

contract IntegerOverflowBenign1 {
    uint public count = 1;

    function run(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, input) }
        // <yes> <report> ARITHMETIC
        uint res = count - input;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,res)}
    }
}
