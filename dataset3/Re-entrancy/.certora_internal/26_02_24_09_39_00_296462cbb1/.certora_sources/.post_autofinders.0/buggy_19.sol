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
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
	   (bool success,) =payable(msg.sender).call{value:balances_re_ent1[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010004,0)}
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
function bug_re_ent41() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0004, 0) }
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
    function transferOwnership(address newOwner) logInternal40(newOwner)onlyOwner public {
        require(newOwner != address(0));
        owner = newOwner;
    }modifier logInternal40(address newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00286000, newOwner) } _; }
uint256 counter_re_ent42 =0;
function callme_re_ent42() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
        require(counter_re_ent42<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
}

contract ethBank is owned{
    
    receive() external payable {}
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) }
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
    
    function withdrawForUser(address payable _address,uint amount) logInternal6(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }modifier logInternal6(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, amount) } _; }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00236000, _weiToWithdraw) }
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }

    function moveBrick(uint amount) logInternal15(amount)onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(amount);
    }modifier logInternal15(uint256 amount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6000, amount) } _; }
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    function moveBrickContracts() logInternal17()onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner, "only owner can use this method"); 
        
        payable(msg.sender).transfer(address(this).balance);
    }modifier logInternal17() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) } _; }
mapping(address => uint) balances_re_ent3;
function withdrawFunds_re_ent3 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00216000, _weiToWithdraw) }
        require(balances_re_ent3[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
	(bool success,)= payable(msg.sender).call{value:_weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        require(success);  //bug
        balances_re_ent3[msg.sender] -= _weiToWithdraw;
    }

address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) }
        (bool success,) = lastPlayer_re_ent9.call{value:jackpot_re_ent9}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010006,0)}
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }
    
    
    
    ////////////////////////////////////////////////////////////////////
    
    function joinFlexible() logInternal12()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal12() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) } _; }
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,transferValue_re_ent25)}
        payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
    function joinFixed() logInternal36()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal36() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240004, 0) } _; }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (payable(msg.sender).send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    function staticBonus() logInternal9()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal9() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) } _; }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= payable(msg.sender).call{value:userBalance_re_ent26[msg.sender]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
    function activeBonus() logInternal22()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal22() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) } _; }
    function teamAddBonus() logInternal38()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal38() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260004, 0) } _; }
    function staticBonusCacl() logInternal37()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal37() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250004, 0) } _; }
    function activeBonusCacl_1() logInternal34()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal34() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220004, 0) } _; }
    function activeBonusCacl_2() logInternal26()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal26() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) } _; }
    function activeBonusCacl_3() logInternal23()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal23() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170004, 0) } _; }
    function activeBonusCacl_4() logInternal18()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal18() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) } _; }
    function activeBonusCacl_5() logInternal24()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal24() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) } _; }
    function activeBonusCacl_6() logInternal25()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal25() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190004, 0) } _; }
    function activeBonusCacl_7() logInternal32()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal32() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) } _; }
    function activeBonusCacl_8() logInternal39()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal39() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270004, 0) } _; }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) }
	   if (payable(msg.sender).send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
    function activeBonusCacl_9() logInternal28()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal28() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0004, 0) } _; }
    function teamAddBonusCacl() logInternal30()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal30() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) } _; }
    function caclTeamPerformance() logInternal13()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal13() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) } _; }
    function releaStaticBonus() logInternal21()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal21() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) } _; }
    function releaActiveBonus() logInternal8()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal8() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) } _; }
    function releaTeamAddBonus() logInternal19()onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        payable(msg.sender).transfer(address(this).balance);
        
    }modifier logInternal19() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) } _; }
bool not_called_re_ent13 = true;
function bug_re_ent13() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }
        require(not_called_re_ent13);
    (bool success,)=payable(msg.sender).call{value:1 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
}
