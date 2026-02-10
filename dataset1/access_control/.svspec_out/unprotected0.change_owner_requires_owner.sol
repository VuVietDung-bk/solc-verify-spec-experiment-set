/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/unprotected_function/Unprotected.sol
 * @author: -
 * @vulnerable_at_lines: 25
 */

pragma solidity >=0.7.0;

 contract Unprotected{
     address private owner;

     modifier onlyowner {
         require(msg.sender==owner);
         _;
     }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
     constructor()
     {
         owner = msg.sender;
     }

     // This function should be protected
     // <yes> <report> ACCESS_CONTROL
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition owner != address(0)
    /// @notice postcondition owner == __verifier_old_address(owner)
     function changeOwner(address _newOwner)
         public
     {
        owner = _newOwner;
     }

    /*
    function changeOwner_fixed(address _newOwner)
         public
         onlyowner
     {
        owner = _newOwner;
     }
     */
 }
