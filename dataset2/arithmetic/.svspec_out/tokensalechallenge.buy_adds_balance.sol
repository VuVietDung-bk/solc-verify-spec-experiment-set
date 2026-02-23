/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-101 // https://capturetheether.com/challenges/math/token-sale/
 * @author: Steve Marx
 * @vulnerable_at_lines: 23,25,33
 */

pragma solidity >=0.7.0;

contract TokenSaleChallenge {
    mapping(address => uint256) public balanceOf;
    uint256 constant PRICE_PER_TOKEN = 1 ether;

    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition PRICE_PER_TOKEN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    constructor(address _player) payable {
        require(msg.value == 1 ether);
    }

    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition PRICE_PER_TOKEN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function isComplete() public view returns (bool) {
        return address(this).balance < 1 ether;
    }

    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition PRICE_PER_TOKEN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition numTokens >= 0
    /// @notice postcondition balanceOf[msg.sender] == __verifier_old_uint(balanceOf[msg.sender]) + numTokens
    function buy(uint256 numTokens) public payable {
        // <yes> <report> ARITHMETIC
        require(msg.value == numTokens * PRICE_PER_TOKEN);
        // <yes> <report> ARITHMETIC
        balanceOf[msg.sender] += numTokens;
    }

    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition PRICE_PER_TOKEN >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition numTokens >= 0
    function sell(uint256 numTokens) public {
        require(balanceOf[msg.sender] >= numTokens);

        balanceOf[msg.sender] -= numTokens;
        // <yes> <report> ARITHMETIC
        payable(msg.sender).transfer(numTokens * PRICE_PER_TOKEN);
    }
}
