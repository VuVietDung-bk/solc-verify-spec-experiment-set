/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  address public owner;
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=payable(msg.sender).call{value:_weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  address public newOwner;

  bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        payable(msg.sender).transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

abstract contract Token{
  function balanceOf(address who) external view virtual returns (uint256);
    function transferFrom(address from, address to, uint256 value) external virtual returns (bool);
    function transfer(address to, uint256 value) external virtual returns (bool);
}

contract Staking is Owned{
  Token public token;
  bool lock;
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
  uint256 public minstakeTokens;
  uint256 private basePercent = 200;
    using SafeMath for uint256;
mapping(address => uint) userBalance_re_ent19;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
  uint256 public stakeTime = 1814400; // 3 weeks = 3*7*24*60*60  OR 1 week = 604800 secs, 3 weeks = 3*604800 = 1,814,400
mapping(address => uint) userBalance_re_ent26;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
  uint public stakePercentage = 30;
  event stakingstarted(address staker, uint256 tokens, uint256 time);
bool not_called_re_ent13 = true;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
  event tokensRedeemed(address staker, uint256 stakedTokens, uint256 reward);
    
    struct stake{
        uint256 time;
        bool redeem;
        uint256 tokens;
    }
  mapping(address => stake) staker;
    
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor(address tokenContractAddress){
        token = Token(tokenContractAddress);
        owner = msg.sender;
        minstakeTokens = 500 * 10 ** uint(10);
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition stakeTokens >= 0
    function startStaking(uint256 stakeTokens) public{
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function redeem() public{
        require(!lock);
        require(!staker[msg.sender].redeem);
        require(staker[msg.sender].time + stakeTime <= block.timestamp);
        require(token.transfer(msg.sender,staker[msg.sender].tokens));
        require(token.transferFrom(owner, msg.sender ,staker[msg.sender].tokens * stakePercentage * 100 / 10000));
        emit tokensRedeemed(msg.sender, staker[msg.sender].tokens, staker[msg.sender].tokens * stakePercentage * 100 / 10000);
        staker[msg.sender].redeem = true;
        staker[msg.sender].tokens = 0;
    }
mapping(address => uint) balances_re_ent8;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdraw_balances_re_ent8 () public {
      (bool success,) = payable(msg.sender).call{value:balances_re_ent8[msg.sender ]}("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _NewTokensThreshold >= 0
    function changeStakeTokens(uint256 _NewTokensThreshold) public onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _newStakeTime >= 0
    function changeStakeTime(uint256 _newStakeTime) public onlyOwner{
        stakeTime = _newStakeTime;
    }
mapping(address => uint) balances_re_ent36;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function withdraw_balances_re_ent36 () public {
         if (payable(msg.sender).send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _newStakePercentage >= 0
    function changeStakingPercentage(uint _newStakePercentage) public onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent38[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition minstakeTokens >= 0
    /// @notice precondition basePercent >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition stakeTime >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition stakePercentage >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function lockWithdrawals() public onlyOwner{
        lock = true;
    }
    
    function findOnePercent(uint256 value) private view returns (uint256)  {
        uint256 roundValue = value.ceil(basePercent);
        uint256 onePercent = roundValue.mul(basePercent).div(10000);
        return onePercent;
    }
}
