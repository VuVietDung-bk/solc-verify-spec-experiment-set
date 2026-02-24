/**
 *Submitted for verification at Etherscan.io on 2019-09-28
*/

pragma solidity >=0.7.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, b) }
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,c)}
    require(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, b) }
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, b) }
    require(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    require(c >= a);
    return c;
  }

}

/**
 * @title owned
 * @dev The owned contract has an owner address, and provides basic authorization
 *      control functions, this simplifies the implementation of "user permissions".
 */
contract owned {
  function my_func_uncheck48(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176000, dst) }
      dst.call{value: msg.value}("");
    }
  address public owner;
    /**
     * @dev The owned constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() {
        owner = msg.sender;
    }
function withdrawBal_unchk17 () public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
	uint64 Balances_unchk17 = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,Balances_unchk17)}
	payable(msg.sender).send(Balances_unchk17);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     */
    function transferOwnership(address newOwner) logInternal30(newOwner)onlyOwner public {
        require(newOwner != address(0));
        owner = newOwner;
    }modifier logInternal30(address newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e6000, newOwner) } _; }
function callnotchecked_unchk37(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, callee) }
    callee.call{value: 1 ether}("");
  }
}

contract ethBank is owned{
    
        receive() external payable {}
function bug_unchk3(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146000, addr) }addr.send (42 ether); }
    
    function withdrawForUser(address payable _address,uint amount) logInternal5(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }modifier logInternal5(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, amount) } _; }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
        require(payedOut_unchk9);
    payable(msg.sender).send(address(this).balance);
    }

    function moveBrick(uint amount) logInternal18(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(amount);
    }modifier logInternal18(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, amount) } _; }
function callnotchecked_unchk25(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196000, callee) }
    callee.call{value: 1 ether}("");
  }
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    function moveBrickContracts() logInternal21()onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner, "only owner can use this method"); 
        
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal21() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) } _; }
function bug_unchk19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
address payable addr_unchk19;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

function unhandledsend_unchk26(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136000, callee) }
    callee.send(5 ether);
  }
    
    
    
    ////////////////////////////////////////////////////////////////////
    
    function joinFlexible() logInternal12()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal12() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) } _; }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    function joinFixed() logInternal16()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal16() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) } _; }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0004, 0) }
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function staticBonus() logInternal9()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal9() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) } _; }
function unhandledsend_unchk38(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6000, callee) }
    callee.send(5 ether);
  }
    function activeBonus() logInternal29()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal29() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) } _; }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116002, winner_unchk46) }
        uint64 subpot_unchk46 = 3 ether;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,subpot_unchk46)}
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,subpot_unchk46)}
}
    function teamAddBonus() logInternal26()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal26() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) } _; }
function UncheckedExternalCall_unchk4 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) }  address payable addr_unchk4;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function staticBonusCacl() logInternal22()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal22() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) } _; }
function bug_unchk7() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }
address payable addr_unchk7;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function activeBonusCacl_1() logInternal15()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal15() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) } _; }
function my_func_unchk23(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00186000, dst) }
        dst.send(msg.value);
    }
}
