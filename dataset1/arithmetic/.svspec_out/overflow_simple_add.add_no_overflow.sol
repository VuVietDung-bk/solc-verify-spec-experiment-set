/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101#overflow-simple-addsol
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;

contract Overflow_Add {
    uint public balance = 1;

    /// @notice precondition balance >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition deposit >= 0
    /// @notice postcondition balance == __verifier_old_uint(balance) + deposit
    function add(uint256 deposit) public {
        // <yes> <report> ARITHMETIC
        balance += deposit;
    }
}
