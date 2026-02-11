/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-104#unchecked-return-valuesol
 * @author: -
 * @vulnerable_at_lines: 17
 */

pragma solidity >=0.7.0;

contract ReturnValue {

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function callchecked(address callee) public {
    (bool success, ) = callee.call("");
    require(success);
  }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition false
  function callnotchecked(address callee) public {
     // <yes> <report> UNCHECKED_LL_CALLS
    callee.call("");
  }
}
