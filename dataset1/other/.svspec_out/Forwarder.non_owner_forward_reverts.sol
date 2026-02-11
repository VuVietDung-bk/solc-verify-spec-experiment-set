pragma solidity >=0.7.0;

/// @title Arbitrary Data Forwarder
/// @author @nicholashc
contract Forwarder {

    address internal owner;

    /// @notice set contract deployer as owner
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor() {
      owner = msg.sender;
    }

    /// @notice Forward arbitrary data to an arbitrary address
    /// @dev Only the contract deployer is allowed to call this function
    /// @param add the address to forward to
    /// @param data arbitrary data of any length
    /// @return success low level call failed or succeeded
    /// @return message any data returned by the call (not necessarily anything will be returned even on success)
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition msg.sender != owner
    /// @notice postcondition false
    function forward(address payable add, bytes calldata data) external payable returns(bool success, bytes memory message) {
        require(msg.sender == owner);
        return add.call{value: msg.value}(data);
    }
}
