/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 27
 */

pragma solidity >=0.7.0;
abstract contract Token {
    function transfer(address _to, uint _value) public virtual returns (bool success);
    function balanceOf(address _owner) public virtual returns (uint balance);
}
contract EtherGet {
    address owner;
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor() {
        owner = msg.sender;
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdrawTokens(address tokenContract) public {
        Token tc = Token(tokenContract);
        tc.transfer(owner, tc.balanceOf(address(this)));
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdrawEther() public {
        payable(owner).transfer(address(this).balance);
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition num >= 0
    /// @notice postcondition false
    function getTokens(uint num, address addr) public {
        for(uint i = 0; i < num; i++){
            // <yes> <report> UNCHECKED_LL_CALLS
            addr.call{value: 0 wei}("");
        }
    }
}
