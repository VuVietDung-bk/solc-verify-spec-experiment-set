/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {

  address public owner;
  mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, _secondsToIncrease) }
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
  require(block.timestamp > lockTime_intou17[msg.sender]);    
        uint transferValue_intou17 = 10;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,transferValue_intou17)}           
  payable(msg.sender).transfer(transferValue_intou17);
    }
  address public newOwner;

  function bug_intou27() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
    uint8 vundflw =0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,vundflw)}
    vundflw = vundflw -10;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,vundflw)}   // underflow bug
}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public logInternal13(_newOwner)onlyOwner {
        newOwner = _newOwner;
    }modifier logInternal13(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6000, _newOwner) } _; }
mapping(address => uint) balances_intou38;

function transfer_intou38(address _to, uint _value) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, _value) }
    require(balances_intou38[msg.sender] - _value >= 0);  //bug
    balances_intou38[msg.sender] -= _value;  //bug
    balances_intou38[_to] += _value;  //bug
    return true;
  }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, b) }
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, b) }
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, b) }
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
    require(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, m) }
    uint256 c = add(a,m);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,c)}
    uint256 d = sub(c,1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,d)}
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
    function startStaking(uint256 stakeTokens) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, stakeTokens) }
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
    function redeem() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        require(!lock);
        require(!staker[msg.sender].redeem);
        require(staker[msg.sender].time + stakeTime <= block.timestamp);
        require(token.transfer(msg.sender,staker[msg.sender].tokens));
        require(token.transferFrom(owner, msg.sender ,staker[msg.sender].tokens * stakePercentage * 100 / 10000));
        emit tokensRedeemed(msg.sender, staker[msg.sender].tokens, staker[msg.sender].tokens * stakePercentage * 100 / 10000);
        staker[msg.sender].redeem = true;
        staker[msg.sender].tokens = 0;
    }
    function changeStakeTokens(uint256 _NewTokensThreshold) public logInternal17(_NewTokensThreshold)onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }modifier logInternal17(uint256 _NewTokensThreshold) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, _NewTokensThreshold) } _; }
    
    function changeStakeTime(uint256 _newStakeTime) public logInternal14(_newStakeTime)onlyOwner{
        stakeTime = _newStakeTime;
    }modifier logInternal14(uint256 _newStakeTime) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, _newStakeTime) } _; }
    
    function changeStakingPercentage(uint _newStakePercentage) public logInternal11(_newStakePercentage)onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }modifier logInternal11(uint256 _newStakePercentage) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, _newStakePercentage) } _; }
    
    function lockWithdrawals() public logInternal12()onlyOwner{
        lock = true;
    }modifier logInternal12() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) } _; }
    
    function findOnePercent(uint256 value) private view returns (uint256)  {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6000, value) }
        uint256 roundValue = value.ceil(basePercent);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,roundValue)}
        uint256 onePercent = roundValue.mul(basePercent).div(10000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,onePercent)}
        return onePercent;
    }
}
