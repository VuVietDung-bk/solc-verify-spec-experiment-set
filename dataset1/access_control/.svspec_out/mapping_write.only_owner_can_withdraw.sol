/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-124#mapping-writesol
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 20
 */

pragma solidity >=0.7.0;

 //This code is derived from the Capture the Ether https://capturetheether.com/challenges/math/mapping/

 contract Map {
     address public owner;
     uint256[] map;

    /// @notice precondition property(map) (extraIndex0) map[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition key >= 0
    /// @notice precondition value >= 0
     function set(uint256 key, uint256 value) public {
         while (map.length <= key) {
             map.push(0);
         }
        // <yes> <report> ACCESS_CONTROL
         map[key] = value;
     }

    /// @notice precondition property(map) (extraIndex0) map[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition key >= 0
     function get(uint256 key) public view returns (uint256) {
         return map[key];
     }
    /// @notice precondition property(map) (extraIndex0) map[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender != owner
    /// @notice postcondition false
     function withdraw() public{
       require(msg.sender == owner);
       payable(msg.sender).transfer(address(this).balance);
     }
 }
