/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: -
 * @vulnerable_at_lines: 18,20
 */

pragma solidity >=0.7.0;

contract Roulette {
    uint public pastBlockTime; // Forces one bet per block

    /// @notice precondition pastBlockTime >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    constructor() payable {} // initially fund contract

    // fallback function used to make a bet
    /// @notice precondition pastBlockTime >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition msg.value > 0
    /// @notice postcondition address(this).balance == __verifier_old_uint(address(this).balance) + msg.value
    fallback() external payable {
        require(msg.value == 10 ether); // must send 10 ether to play
        // <yes> <report> TIME_MANIPULATION
        require(block.timestamp != pastBlockTime); // only 1 transaction per block
        // <yes> <report> TIME_MANIPULATION
        pastBlockTime = block.timestamp;
        if(block.timestamp % 15 == 0) { // winner
            payable(msg.sender).transfer(address(this).balance);
        }
    }

    /// @notice precondition pastBlockTime >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {

    }
}
