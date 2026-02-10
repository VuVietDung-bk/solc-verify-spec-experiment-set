/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/wrong_constructor_name/incorrect_constructor.sol
 * @author: Ben Perez
 * @vulnerable_at_lines: 20
 */

pragma solidity >=0.7.0;

contract Missing{
    address private owner;

    modifier onlyowner {
        require(msg.sender==owner);
        _;
    }

    // The name of the constructor should be Missing
    // Anyone can call the IamMissing once the contract is deployed
    // <yes> <report> ACCESS_CONTROL
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition owner != address(0)
    /// @notice postcondition owner == __verifier_old_address(owner)
    function IamMissing()
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
