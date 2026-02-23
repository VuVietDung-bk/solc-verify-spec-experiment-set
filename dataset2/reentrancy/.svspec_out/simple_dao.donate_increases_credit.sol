/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#simpledao
 * @author: -
 * @vulnerable_at_lines: 19
 */

pragma solidity >=0.7.0;

contract SimpleDAO {
  mapping (address => uint) public credit;

    /// @notice precondition forall (address extraVar0) credit[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice postcondition credit[to] == __verifier_old_uint(credit[to]) + msg.value
  function donate(address to) public payable {
    credit[to] += msg.value;
  }

    /// @notice precondition forall (address extraVar0) credit[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
  function withdraw(uint amount) public {
    if (credit[msg.sender]>= amount) {
      // <yes> <report> REENTRANCY
      (bool res, ) = msg.sender.call{value: amount}("");
      credit[msg.sender]-=amount;
    }
  }

    /// @notice precondition forall (address extraVar0) credit[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function queryCredit(address to) public returns (uint){
    return credit[to];
  }
}
