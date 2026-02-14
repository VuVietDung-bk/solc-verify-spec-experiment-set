/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
address public owner;
  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = payable(msg.sender);
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  address public newOwner;

  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }
modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
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
  uint256 public minstakeTokens;
  uint256 private basePercent = 200;
    using SafeMath for uint256;
  uint256 public stakeTime = 1814400; // 3 weeks = 3*7*24*60*60  OR 1 week = 604800 secs, 3 weeks = 3*604800 = 1,814,400
uint public stakePercentage = 30;
  event stakingstarted(address staker, uint256 tokens, uint256 time);
  event tokensRedeemed(address staker, uint256 stakedTokens, uint256 reward);
    
    struct stake{
        uint256 time;
        bool redeem;
        uint256 tokens;
    }
mapping(address => stake) staker;
    
    
    constructor(address tokenContractAddress) {
        token = Token(tokenContractAddress);
        owner = msg.sender;
        minstakeTokens = 500 * 10 ** uint(10);
    }
function startStaking(uint256 stakeTokens) public{
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
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
function changeStakeTokens(uint256 _NewTokensThreshold) public onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }
    
    function changeStakeTime(uint256 _newStakeTime) public onlyOwner{
        stakeTime = _newStakeTime;
    }
function changeStakingPercentage(uint _newStakePercentage) public onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }
    
    function lockWithdrawals() public onlyOwner{
        lock = true;
    }
function findOnePercent(uint256 value) private view returns (uint256)  {
        uint256 roundValue = value.ceil(basePercent);
        uint256 onePercent = roundValue.mul(basePercent).div(10000);
        return onePercent;
    }
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        payable(msg.sender).transfer(reward_TOD2);
        claimed_TOD2 = true;
    }

}
