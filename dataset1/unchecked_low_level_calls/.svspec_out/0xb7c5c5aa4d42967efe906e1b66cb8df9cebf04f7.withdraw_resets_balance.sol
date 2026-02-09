/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 25
 */

pragma solidity >=0.7.0;

/*
!!! THIS CONTRACT IS EXPLOITABLE AND FOR EDUCATIONAL PURPOSES ONLY !!!

This smart contract allows a user to (insecurely) store funds
in this smart contract and withdraw them at any later point in time
*/

contract keepMyEther {
    mapping(address => uint256) public balances;
    
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    fallback() payable external {
        balances[msg.sender] += msg.value;
    }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() payable external {
        
    }
    
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition balances[msg.sender] > 0
    /// @notice postcondition balances[msg.sender] == 0
    /// @notice postcondition address(this).balance == __verifier_old_uint(address(this).balance) - __verifier_old_uint(balances[msg.sender])
    function withdraw() public {
        // <yes> <report> UNCHECKED_LL_CALLS
        msg.sender.call{value: balances[msg.sender]}("");
        balances[msg.sender] = 0;
    }
}
