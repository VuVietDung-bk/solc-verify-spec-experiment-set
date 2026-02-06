/*
 * @source: https://github.com/trailofbits/not-so-smart-contracts/blob/master/integer_overflow/integer_overflow_1.sol
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;

 contract Overflow {
     uint private sellerBalance=0;

    /// @notice precondition sellerBalance >= 0
    /// @notice precondition value >= 0
    /// @notice postcondition sellerBalance == __verifier_old_uint(sellerBalance) + value
     function add(uint value) public returns (bool){
         // <yes> <report> ARITHMETIC
         sellerBalance += value; // possible overflow

         // possible auditor assert
         // assert(sellerBalance >= value);
     }

  // function safe_add(uint value) returns (bool){
  //   require(value + sellerBalance >= sellerBalance);
  // sellerBalance += value;
  // } 
 }
