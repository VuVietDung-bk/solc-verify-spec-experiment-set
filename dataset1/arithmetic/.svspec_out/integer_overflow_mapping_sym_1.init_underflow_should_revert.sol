/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/integer_overflow_and_underflow/integer_overflow_mapping_sym_1.sol
 * @author: -
 * @vulnerable_at_lines: 16
 */

//Single transaction overflow

pragma solidity >=0.7.0;

contract IntegerOverflowMappingSym1 {
    mapping(uint256 => uint256) map;

    /// @notice precondition forall (uint256 extraVar0) map[extraVar0] >= 0
    /// @notice precondition k >= 0
    /// @notice precondition v >= 0
    /// @notice precondition v > map[k]
    /// @notice postcondition map[k] == __verifier_old_uint(map[k]) - v
    function init(uint256 k, uint256 v) public {
        // <yes> <report> ARITHMETIC
        map[k] -= v;
    }
}
