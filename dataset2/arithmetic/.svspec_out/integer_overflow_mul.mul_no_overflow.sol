/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_mul.sol
 * @author: -
 * @vulnerable_at_lines: 17
 */

//Single transaction overflow
//Post-transaction effect: overflow escapes to publicly-readable storage

pragma solidity >=0.7.0;

contract IntegerOverflowMul {
    uint public count = 2;

    /// @notice precondition count >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition input >= 0
    /// @notice postcondition count == __verifier_old_uint(count) * input
    function run(uint256 input) public {
        // <yes> <report> ARITHMETIC
        count *= input;
    }
}
