/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#oddsandevens
 * @author: -
 * @vulnerable_at_lines: 25,28
 */

pragma solidity >=0.7.0;

contract OddsAndEvens{

  struct Player {
    address addr;
    uint number;
  }

  Player[2] public players;         //public only for debug purpose

  uint8 tot;
  address owner;

  constructor() {
    owner = msg.sender;
  }
// <yes> <report> FRONT_RUNNING
  function play(uint number) public payable {uint256 certoraRename1_0 = number;assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, certoraRename1_0) }
    if (msg.value != 1 ether) revert();
    // <yes> <report> FRONT_RUNNING
    players[tot] = Player(msg.sender, number);
    tot++;

    if (tot==2) andTheWinnerIs();
  }

  function andTheWinnerIs() private {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
    bool res ;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,res)}
    uint n = players[0].number+players[1].number;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,n)}
    if (n%2==0) {
      address playerAddr = players[0].addr;
      res = payable(playerAddr).send(1800);
    }
    else {
      address playerAddr = players[1].addr;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,playerAddr)}
      res = payable(playerAddr).send(1800);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,res)}
    }

    delete players;
    tot=0;
  }

  function getProfit() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
    if(msg.sender!=owner) revert();
    bool res = payable(msg.sender).send(address(this).balance);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,res)}
  }

}
