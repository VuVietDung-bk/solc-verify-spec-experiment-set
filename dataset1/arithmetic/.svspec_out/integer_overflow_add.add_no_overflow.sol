/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite/blob/master/benchmarks/integer_overflow_add.sol
 * @author: -
 * @vulnerable_at_lines: 17
 */

//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage

pragma solidity >=0.7.0;

contract IntegerOverflowAdd {
    uint public count = 1;

    /// @notice precondition count >= 0
    /// @notice precondition input >= 0
    /// @notice postcondition count == __verifier_old_uint(count) + input
    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count += input;
    }
}
