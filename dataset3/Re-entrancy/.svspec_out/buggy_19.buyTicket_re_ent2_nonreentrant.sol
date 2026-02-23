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
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {
	   (bool success,) =payable(msg.sender).call{value:balances_re_ent1[msg.sender ]}("");
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  address public owner;
    /**
     * @dev The owned constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
        if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
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
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
}

contract ethBank is owned{
    
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {}
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition lastPlayer_re_ent2 == msg.sender
    /// @notice postcondition lastPlayer_re_ent2 == msg.sender || __verifier_old_uint(address(this).balance) >= address(this).balance
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
    
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition amount >= 0
    function withdrawForUser(address payable _address,uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }
mapping(address => uint) balances_re_ent17;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
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
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function moveBrickContracts() onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner, "only owner can use this method"); 
        
        payable(msg.sender).transfer(address(this).balance);
    }
mapping(address => uint) balances_re_ent3;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= payable(msg.sender).call{value:_weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
	  function buyTicket_re_ent9() public{
        (bool success,) = lastPlayer_re_ent9.call{value:jackpot_re_ent9}("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }
    
    
    
    ////////////////////////////////////////////////////////////////////
    
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function joinFlexible() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
mapping(address => uint) redeemableEther_re_ent25;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function joinFixed() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
mapping(address => uint) userBalance_re_ent19;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (payable(msg.sender).send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function staticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
mapping(address => uint) userBalance_re_ent26;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= payable(msg.sender).call{value:userBalance_re_ent26[msg.sender]}("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function teamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function staticBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_1() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_2() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_3() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_4() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_5() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_6() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_7() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_8() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
mapping(address => uint) balances_re_ent36;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdraw_balances_re_ent36 () public {
	   if (payable(msg.sender).send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function activeBonusCacl_9() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function teamAddBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function caclTeamPerformance() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaStaticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaActiveBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function releaTeamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }
bool not_called_re_ent13 = true;
    /// @notice precondition forall (address extraVar0) balances_re_ent1[extraVar0] >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent3[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function bug_re_ent13() public{
        require(not_called_re_ent13);
    (bool success,)=payable(msg.sender).call{value:1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
}
