/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 25
 */

//Multi-transactional, multi-function
//Arithmetic instruction reachable

pragma solidity >=0.7.0;

contract IntegerOverflowMultiTxMultiFuncFeasible {
    uint256 private initialized = 0;
    uint256 public count = 1;

    /// @notice precondition initialized >= 0
    /// @notice precondition count >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function init() public {
        initialized = 1;
    }

    /// @notice precondition initialized >= 0
    /// @notice precondition count >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition input >= 0
    /// @notice precondition initialized == 1
    /// @notice postcondition count == __verifier_old_uint(count) - input
    function run(uint256 input) public {
        if (initialized == 0) {
            return;
        }
        // <yes> <report> ARITHMETIC
        count -= input;
    }
}
