/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/denial_of_service/auction.sol
 * @author: -
 * @vulnerable_at_lines: 23
 */

pragma solidity >=0.7.0;

//Auction susceptible to DoS attack
/// @notice invariant currentBid >= 0
contract DosAuction {
  address currentFrontrunner;
  uint currentBid;

  //Takes in bid, refunding the frontrunner if they are outbid
    /// @notice precondition currentBid >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition msg.value > currentBid
    /// @notice precondition msg.sender != currentFrontrunner
    /// @notice precondition currentFrontrunner != address(0)
    /// @notice postcondition currentBid == msg.value
    /// @notice postcondition currentFrontrunner == msg.sender
  function bid() public payable {
    require(msg.value > currentBid);

    //If the refund fails, the entire transaction reverts.
    //Therefore a frontrunner who always fails will win
    if (currentFrontrunner != address(0)) {
      //E.g. if recipients fallback function is just revert()
      // <yes> <report> DENIAL_OF_SERVICE
      require(payable(currentFrontrunner).send(currentBid));
    }

    currentFrontrunner = msg.sender;
    currentBid         = msg.value;
  }
}
