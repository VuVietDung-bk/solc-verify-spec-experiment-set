/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 18
 */

pragma solidity >=0.7.0;

contract ReentrancyDAO {
    mapping (address => uint) credit;
    uint balance;

    /// @notice precondition forall (address extraVar0) credit[extraVar0] >= 0
    /// @notice precondition balance >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition credit[msg.sender] == 0
    function withdrawAll() public {
        uint oCredit = credit[msg.sender];
        if (oCredit > 0) {
            balance -= oCredit;
            // <yes> <report> REENTRANCY
            (bool callResult, ) = msg.sender.call{value: oCredit}("");
            require (callResult);
            credit[msg.sender] = 0;
        }
    }

    /// @notice precondition forall (address extraVar0) credit[extraVar0] >= 0
    /// @notice precondition balance >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function deposit() public payable {
        credit[msg.sender] += msg.value;
        balance += msg.value;
    }
}
