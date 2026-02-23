/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 33
 */

pragma solidity >=0.7.0;


contract SimpleWallet {
    address public owner = msg.sender;
    uint public depositsCount;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    /// @notice precondition depositsCount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {
        depositsCount++;
    }
    
    /// @notice precondition depositsCount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdrawAll() public onlyOwner {
        withdraw(address(this).balance);
    }
    
    /// @notice precondition depositsCount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    /// @notice precondition msg.sender != owner
    /// @notice postcondition false
    function withdraw(uint _value) public onlyOwner {
        payable(msg.sender).transfer(_value);
    }
    
    /// @notice precondition depositsCount >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    function sendMoney(address _target, uint _value, bytes memory _data) public onlyOwner {
        // <yes> <report> UNCHECKED_LL_CALLS
        _target.call{value: _value}(_data);
    }
}
