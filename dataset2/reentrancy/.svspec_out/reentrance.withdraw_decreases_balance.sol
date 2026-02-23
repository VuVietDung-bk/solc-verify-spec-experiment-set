/*
 * @source: https://ethernaut.zeppelin.solutions/level/0xf70706db003e94cfe4b5e27ffd891d5c81b39488
 * @author: Alejandro Santander
 * @vulnerable_at_lines: 24
 */

pragma solidity >=0.7.0;

contract Reentrance {

  mapping(address => uint) public balances;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
  function donate(address _to) public payable {
    balances[_to] += msg.value;
  }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _amount >= 0
    /// @notice precondition balances[msg.sender] >= _amount
    /// @notice postcondition balances[msg.sender] == __verifier_old_uint(balances[msg.sender]) - _amount
  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      // <yes> <report> REENTRANCY
      (bool success, ) = msg.sender.call{value: _amount}("");
      if(success) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
  receive() external payable {}
}
