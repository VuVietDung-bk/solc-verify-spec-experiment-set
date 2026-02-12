/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
  function bug_tmstmp9() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
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
function play_tmstmp23(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }
uint256 bugv_tmstmp1 = block.timestamp;

    function transferOwnership(address _newOwner) public logInternal11(_newOwner)onlyOwner {
      newOwner = _newOwner;
    }modifier logInternal11(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, _newOwner) } _; }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, b) }
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046001, b) }
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, b) }
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
    require(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, m) }
    uint256 c = add(a,m);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
    uint256 d = sub(c,1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,d)}
    return mul(div(d,m),m);
  }
}

abstract contract Token{
  function balanceOf(address who) external view virtual returns (uint256);
  function transferFrom(address from, address to, uint256 value) external virtual returns (bool);
function bug_tmstmp8 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
	uint pastBlockTime_tmstmp8;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,pastBlockTime_tmstmp8)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
  require(block.timestamp != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
  pastBlockTime_tmstmp8 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,pastBlockTime_tmstmp8)}       //bug
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

    function startStaking(uint256 stakeTokens) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, stakeTokens) }
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
    function redeem() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
        require(!lock);
        require(!staker[msg.sender].redeem);
        require(staker[msg.sender].time + stakeTime <= block.timestamp);
        require(token.transfer(msg.sender,staker[msg.sender].tokens));
        require(token.transferFrom(owner, msg.sender ,staker[msg.sender].tokens * stakePercentage * 100 / 10000));
        emit tokensRedeemed(msg.sender, staker[msg.sender].tokens, staker[msg.sender].tokens * stakePercentage * 100 / 10000);
        staker[msg.sender].redeem = true;
        staker[msg.sender].tokens = 0;
    }
    function changeStakeTokens(uint256 _NewTokensThreshold) public logInternal15(_NewTokensThreshold)onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }modifier logInternal15(uint256 _NewTokensThreshold) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6000, _NewTokensThreshold) } _; }
    function changeStakeTime(uint256 _newStakeTime) public logInternal12(_newStakeTime)onlyOwner{
        stakeTime = _newStakeTime;
    }modifier logInternal12(uint256 _newStakeTime) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6000, _newStakeTime) } _; }
    function changeStakingPercentage(uint _newStakePercentage) public logInternal9(_newStakePercentage)onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }modifier logInternal9(uint256 _newStakePercentage) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, _newStakePercentage) } _; }
    function lockWithdrawals() public logInternal10()onlyOwner{
        lock = true;
    }modifier logInternal10() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) } _; }
    function findOnePercent(uint256 value) private view returns (uint256)  {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086000, value) }
        uint256 roundValue = value.ceil(basePercent);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,roundValue)}
        uint256 onePercent = roundValue.mul(basePercent).div(10000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,onePercent)}
        return onePercent;
    }
uint256 bugv_tmstmp5 = block.timestamp;
}
