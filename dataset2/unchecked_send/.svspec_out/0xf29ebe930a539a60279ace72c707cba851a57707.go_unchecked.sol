/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 16
 */

pragma solidity >=0.7.0;


contract B {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    }
    
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice postcondition address(this).balance == 0
    /// @notice postcondition 0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C.balance == __verifier_old_uint(0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C.balance) + msg.value
    /// @notice postcondition owner.balance == __verifier_old_uint(__verifier_old_address(owner).balance) + __verifier_old_uint(address(this).balance) - msg.value
    function go() public payable {
        address payable target = payable(0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C);
        // <yes> <report> UNCHECKED_LL_CALLS
        target.call{value: msg.value}("");
        owner.transfer(address(this).balance);
    }
    
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {
    }

    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    fallback() external payable {
    }
}
