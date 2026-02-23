/*
 * @source: https://github.com/sigp/solidity-security-blog
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 27
 */

//added pragma version
pragma solidity >=0.7.0;

contract EtherStore {

    uint256 public withdrawalLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawTime;
    mapping(address => uint256) public balances;

    /// @notice precondition withdrawalLimit >= 0
    /// @notice precondition forall (address extraVar0) lastWithdrawTime[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice postcondition balances[msg.sender] == __verifier_old_uint(balances[msg.sender]) + msg.value
    function depositFunds() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice precondition withdrawalLimit >= 0
    /// @notice precondition forall (address extraVar0) lastWithdrawTime[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _weiToWithdraw >= 0
    function withdrawFunds (uint256 _weiToWithdraw) public {
        require(balances[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(_weiToWithdraw <= withdrawalLimit);
        // limit the time allowed to withdraw
        require(block.timestamp >= lastWithdrawTime[msg.sender] + 1 weeks);
        // <yes> <report> REENTRANCY
        (bool success, ) = msg.sender.call{value: _weiToWithdraw}("");
        require(success);
        balances[msg.sender] -= _weiToWithdraw;
        lastWithdrawTime[msg.sender] = block.timestamp;
    }
 }
