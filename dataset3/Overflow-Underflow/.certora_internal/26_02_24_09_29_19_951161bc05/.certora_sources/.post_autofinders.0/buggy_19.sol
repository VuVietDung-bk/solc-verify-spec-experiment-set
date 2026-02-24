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
  // keep the first sample helper of each type
  function bug_intou12(uint8 p_intou12) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, p_intou12) }
    uint8 vundflw1=0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,vundflw1)}
    vundflw1 = vundflw1 + p_intou12;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,vundflw1)}   // overflow bug
  }

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) logInternal33(newOwner)onlyOwner public {
    require(newOwner != address(0));
    owner = newOwner;
  }modifier logInternal33(address newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00216000, newOwner) } _; }

  mapping(address => uint) public lockTime_intou1;

  function increaseLockTime_intou1(uint _secondsToIncrease) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146000, _secondsToIncrease) }
    lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
  }
  function withdraw_ovrflow1() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
    require(block.timestamp > lockTime_intou1[msg.sender]);
    uint transferValue_intou1 = 10;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,transferValue_intou1)}
    payable(msg.sender).transfer(transferValue_intou1);
  }
}

contract ethBank is owned{
    receive() external payable {}

    // first transfer helper kept
    mapping(address => uint) balances_intou2;
    function transfer_undrflow2(address _to, uint _value) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6001, _value) }
      require(balances_intou2[msg.sender] - _value >= 0);  //bug
      balances_intou2[msg.sender] -= _value;  //bug
      balances_intou2[_to] += _value;  //bug
      return true;
    }
    
    function withdrawForUser(address payable _address,uint amount) logInternal7(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }modifier logInternal7(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, amount) } _; }

    function moveBrick(uint amount) logInternal23(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(amount);
    }modifier logInternal23(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176000, amount) } _; }
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    function moveBrickContracts() logInternal24()onlyOwner public
    {
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal24() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) } _; }

    // either settled or refunded. All funds are transferred to contract owner.
    function moveBrickClear() logInternal10()onlyOwner public {
        require(msg.sender == owner, "only owner can use this method"); 
    }modifier logInternal10() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) } _; }
    
    ////////////////////////////////////////////////////////////////////
    
    function joinFlexible() logInternal18()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal18() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) } _; }
    function joinFixed() logInternal22()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal22() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) } _; }
    function staticBonus() logInternal15()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal15() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) } _; }
    function activeBonus() logInternal32()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal32() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) } _; }
    function teamAddBonus() logInternal29()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal29() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) } _; }
    function staticBonusCacl() logInternal27()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal27() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) } _; }
    function activeBonusCacl_1() logInternal21()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal21() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) } _; }
    function activeBonusCacl_2() logInternal9()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal9() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) } _; }
    function activeBonusCacl_3() logInternal4()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal4() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) } _; }
    function activeBonusCacl_4() logInternal25()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal25() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190004, 0) } _; }
    function activeBonusCacl_5() logInternal5()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal5() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) } _; }
    function activeBonusCacl_6() logInternal6()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal6() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) } _; }
    function activeBonusCacl_7() logInternal17()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal17() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) } _; }
    function activeBonusCacl_8() logInternal30()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal30() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) } _; }
    function activeBonusCacl_9() logInternal11()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal11() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) } _; }
    function teamAddBonusCacl() logInternal14()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal14() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0004, 0) } _; }
    function caclTeamPerformance() logInternal19()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal19() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) } _; }
    function releaStaticBonus() logInternal31()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal31() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0004, 0) } _; }
    function releaActiveBonus() logInternal12()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal12() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) } _; }
    function releaTeamAddBonus() logInternal26()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal26() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) } _; }
}
