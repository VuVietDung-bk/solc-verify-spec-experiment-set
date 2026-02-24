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

     function set(uint256 key, uint256 value) public {
         while (map.length <= key) {
             map.push(0);
         }
        // <yes> <report> ACCESS_CONTROL
         map[key] = value;
     }

     function get(uint256 key) public view returns (uint256) {
         return map[key];
     }
     function withdraw() public{
       require(msg.sender == owner);
       payable(msg.sender).transfer(address(this).balance);
     }
 }
