/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: -
 * @vulnerable_at_lines: 17
 */

pragma solidity >=0.7.0;

contract FindThisHash {
    bytes32 constant public hash = 0xb5b5b97fafd9855eec9b41f74dfb6c38f5951141f9a3ecd7f44d5479b630ee0a;

    constructor() payable {} // load with ether

    function solve(string memory solution) public {
        // If you can find the pre image of the hash, receive 1000 ether
         // <yes> <report> TOD
        require(hash == keccak256(abi.encodePacked(solution)));
        payable(msg.sender).transfer(1000 ether);
    }
}
