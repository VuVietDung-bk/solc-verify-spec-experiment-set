/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-118#incorrect-constructor-name2sol
 * @author: Ben Perez
 * @vulnerable_at_lines: 17
 */

pragma solidity >=0.7.0;

contract Missing{
    address private owner;

    modifier onlyowner {
        require(msg.sender==owner);
        _;
    }
    // <yes> <report> ACCESS_CONTROL
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition owner != address(0)
    /// @notice postcondition owner == __verifier_old_address(owner)
    function Constructor()
        public
    {
        owner = msg.sender;
    }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition owner != address(0)
    /// @notice postcondition owner == __verifier_old_address(owner)
    function withdraw()
        public
        onlyowner
    {
       payable(owner).transfer(address(this).balance);
    }

}
