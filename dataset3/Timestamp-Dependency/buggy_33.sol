/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public owner;
  address public newOwner;

  uint256 bugv_tmstmp2 = block.timestamp;
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor(){
        owner = msg.sender;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }
uint256 bugv_tmstmp1 = block.timestamp;

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
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
  require(block.timestamp != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
  pastBlockTime_tmstmp8 = block.timestamp;       //bug
  if(block.timestamp % 15 == 0) { // winner    //bug
    payable(msg.sender).transfer(address(this).balance);
    }
  }
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
  uint256 bugv_tmstmp3 = block.timestamp;
  event stakingstarted(address staker, uint256 tokens, uint256 time);
  uint256 bugv_tmstmp4 = block.timestamp;
  event tokensRedeemed(address staker, uint256 stakedTokens, uint256 reward);

    struct stake{
        uint256 time;
        bool redeem;
        uint256 tokens;
    }
  mapping(address => stake) staker;

    constructor(address tokenContractAddress){
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
uint256 bugv_tmstmp5 = block.timestamp;
}
