/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/denial_of_service/auction.sol
 * @author: -
 * @vulnerable_at_lines: 23
 */

pragma solidity >=0.7.0;

//Auction susceptible to DoS attack
contract DosAuction {
  address currentFrontrunner;
  uint currentBid;

  //Takes in bid, refunding the frontrunner if they are outbid
  function bid() public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
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
