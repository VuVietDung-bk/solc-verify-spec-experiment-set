/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 23,31
 */

pragma solidity >=0.7.0;

contract EthTxOrderDependenceMinimal {
    address public owner;
    bool public claimed;
    uint public reward;

    /// @notice precondition reward >= 0
    constructor() {
        owner = msg.sender;
    }

    /// @notice precondition reward >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function setReward() public payable {
        require (!claimed);

        require(msg.sender == owner);
        // <yes> <report> FRONT_RUNNING
        payable(owner).transfer(reward);
        reward = msg.value;
    }

    /// @notice precondition reward >= 0
    /// @notice precondition submission >= 0
    /// @notice precondition claimed == false
    /// @notice precondition submission < 10
    /// @notice postcondition claimed == true
    function claimReward(uint256 submission) public {
        require (!claimed);
        require(submission < 10);
        // <yes> <report> FRONT_RUNNING
        payable(msg.sender).transfer(reward);
        claimed = true;
    }
}
