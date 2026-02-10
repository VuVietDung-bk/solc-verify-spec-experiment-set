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
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    require(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
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
  function bug_intou12(uint8 p_intou12) public{
    uint8 vundflw1=0;
    vundflw1 = vundflw1 + p_intou12;   // overflow bug
  }

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    owner = newOwner;
  }

  mapping(address => uint) public lockTime_intou1;

  function increaseLockTime_intou1(uint _secondsToIncrease) public {
    lockTime_intou1[msg.sender] += _secondsToIncrease;  //overflow
  }
  function withdraw_ovrflow1() public {
    require(block.timestamp > lockTime_intou1[msg.sender]);
    uint transferValue_intou1 = 10;
    payable(msg.sender).transfer(transferValue_intou1);
  }
}

contract ethBank is owned{
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {}

    // first transfer helper kept
    mapping(address => uint) balances_intou2;
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    /// @notice precondition _value > 0
    /// @notice precondition balances_intou2[msg.sender] == 0
    /// @notice postcondition false
    function transfer_undrflow2(address _to, uint _value) public returns (bool) {
      require(balances_intou2[msg.sender] - _value >= 0);  //bug
      balances_intou2[msg.sender] -= _value;  //bug
      balances_intou2[_to] += _value;  //bug
      return true;
    }
    
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
    function withdrawForUser(address payable _address,uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }

    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
    function moveBrick(uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(amount);
    }
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function moveBrickContracts() onlyOwner public
    {
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }

    // either settled or refunded. All funds are transferred to contract owner.
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function moveBrickClear() onlyOwner public {
        require(msg.sender == owner, "only owner can use this method"); 
    }
    
    ////////////////////////////////////////////////////////////////////
    
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function joinFlexible() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function joinFixed() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function staticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function teamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function staticBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_1() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_2() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_3() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_4() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_5() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_6() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_7() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_8() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_9() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function teamAddBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function caclTeamPerformance() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaStaticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaActiveBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
    /// @notice precondition forall (address extraVar0) lockTime_intou1[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou2[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaTeamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
    }
}
