/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 18,24,30,36,42,48
 */

//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage

pragma solidity >=0.7.0;

contract IntegerOverflowSingleTransaction {
    uint public count = 1;

    // ADD overflow with result stored in state variable.
    function overflowaddtostate(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036000, input) }
        // <yes> <report> ARITHMETIC
        count += input;
    }

    // MUL overflow with result stored in state variable.
    function overflowmultostate(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, input) }
        // <yes> <report> ARITHMETIC
        count *= input;
    }

    // Underflow with result stored in state variable.
    function underflowtostate(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, input) }
        // <yes> <report> ARITHMETIC
        count -= input;
    }

    // ADD Overflow, no effect on state.
    function overflowlocalonly(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046000, input) }
        // <yes> <report> ARITHMETIC
        uint res = count + input;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,res)}
    }

    // MUL Overflow, no effect on state.
    function overflowmulocalonly(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, input) }
        // <yes> <report> ARITHMETIC
        uint res = count * input;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,res)}
    }

    // Underflow, no effect on state.
    function underflowlocalonly(uint256 input) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056000, input) }
        // <yes> <report> ARITHMETIC
       	uint res = count - input;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,res)}
    }

}
