/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-118#incorrect-constructor-name1sol
 * @author: Ben Perez
 * @vulnerable_at_lines: 18
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
    /// @notice postcondition forall (address non_owner) non_owner == __verifier_old_address(owner) || owner == non_owner
    /// @notice postcondition forall (address non_owner) non_owner == address(0) || owner == non_owner
    function missing()
        public
    {
        owner = msg.sender;
    }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdraw()
        public
        onlyowner
    {
       payable(owner).transfer(address(this).balance);
    }
}
