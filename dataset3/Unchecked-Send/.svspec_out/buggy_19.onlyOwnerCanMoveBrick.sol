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
    assert(c / a == b);
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
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

}

/**
 * @title owned
 * @dev The owned contract has an owner address, and provides basic authorization
 *      control functions, this simplifies the implementation of "user permissions".
 */
contract owned {
address public owner;
    /**
     * @dev The owned constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() {
        owner = msg.sender;
    }
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
    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        owner = newOwner;
    }
}

contract ethBank is owned{
    
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {}
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
function withdrawForUser(address payable _address,uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
    /// @notice precondition msg.sender != owner
    /// @notice postcondition false
function moveBrick(uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(amount);
    }
/**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function moveBrickContracts() onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner, "only owner can use this method"); 
        
        payable(msg.sender).transfer(address(this).balance);
    }

////////////////////////////////////////////////////////////////////
    
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function joinFlexible() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function joinFixed() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function staticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function teamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function staticBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_1() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_2() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_3() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_4() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_5() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_6() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_7() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_8() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function activeBonusCacl_9() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function teamAddBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function caclTeamPerformance() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function releaStaticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function releaActiveBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
                payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function releaTeamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
                payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
function bug_unchk_send24() payable public{
    payable(msg.sender).transfer(1 ether);}

}
