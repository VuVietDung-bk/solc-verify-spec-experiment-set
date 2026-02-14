/*
 * @source: https://smartcontractsecurity.github.io/SWC-registry/docs/SWC-112#proxysol
 * @author: -
 * @vulnerable_at_lines: 19
 */

pragma solidity >=0.7.0;

contract Proxy {

  address owner;

  constructor() {
    owner = msg.sender;
  }

  function forward(address callee, bytes memory _data) public {
    // <yes> <report> unsafe delegatecall
    (bool success, ) = callee.delegatecall(_data); //Use delegatecall with caution and make sure to never call into untrusted contracts
    require(success);
  }

}
