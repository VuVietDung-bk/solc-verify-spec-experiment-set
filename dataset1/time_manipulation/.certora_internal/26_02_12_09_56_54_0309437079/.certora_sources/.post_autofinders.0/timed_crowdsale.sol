/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/timestamp_dependence/timed_crowdsale.sol
 * @author: -
 * @vulnerable_at_lines: 13
 */

pragma solidity >=0.7.0;

contract TimedCrowdsale {
  // Sale should finish exactly at January 1, 2019
  function isSaleFinished() view public returns (bool finish) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
    // <yes> <report> TIME_MANIPULATION
    return block.timestamp >= 1546300800;
  }
}
