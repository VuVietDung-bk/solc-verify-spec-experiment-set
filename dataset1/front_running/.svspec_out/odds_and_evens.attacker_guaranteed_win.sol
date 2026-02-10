/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#oddsandevens
 * @author: -
 * @vulnerable_at_lines: 25,28
 */

pragma solidity >=0.7.0;

/// @notice invariant tot <= 2
contract OddsAndEvens{

  struct Player {
    address addr;
    uint number;
  }

  Player[2] public players;         //public only for debug purpose

  uint8 tot;
  address owner;

    /// @notice precondition tot >= 0
  constructor() {
    owner = msg.sender;
  }
// <yes> <report> FRONT_RUNNING
    /// @notice precondition tot >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition number >= 0
    /// @notice precondition tot == 1
    /// @notice precondition msg.value == 1000000000000000000
    /// @notice precondition msg.sender != players[0].addr
    /// @notice precondition players[0].number + number % 2 != 0
    /// @notice postcondition msg.sender.balance == __verifier_old_uint(msg.sender.balance) - 1000000000000000000 + 1800
  function play(uint number) public payable {
    if (msg.value != 1 ether) revert();
    // <yes> <report> FRONT_RUNNING
    players[tot] = Player(msg.sender, number);
    tot++;

    if (tot==2) andTheWinnerIs();
  }

  function andTheWinnerIs() private {
    bool res ;
    uint n = players[0].number+players[1].number;
    if (n%2==0) {
      address playerAddr = players[0].addr;
      res = payable(playerAddr).send(1800);
    }
    else {
      address playerAddr = players[1].addr;
      res = payable(playerAddr).send(1800);
    }

    delete players;
    tot=0;
  }

    /// @notice precondition tot >= 0
  function getProfit() public {
    if(msg.sender!=owner) revert();
    bool res = payable(msg.sender).send(address(this).balance);
  }

}
