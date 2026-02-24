/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
  function bug_unchk3(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056000, addr) }addr.send (42 ether); }
  address public owner;
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        require(payedOut_unchk9);
  payable(msg.sender).send(address(this).balance);
    }
  address public newOwner;

  function bug_unchk31() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
address payable addr_unchk31;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() {
        owner = msg.sender;
    }
function UncheckedExternalCall_unchk4 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }  address payable addr_unchk4;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public logInternal14(_newOwner)onlyOwner {
        newOwner = _newOwner;
    }modifier logInternal14(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, _newOwner) } _; }
function bug_unchk7() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
address payable addr_unchk7;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, b) }
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, b) }
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096001, b) }
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,c)}
    require(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, m) }
    uint256 c = add(a,m);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,c)}
    uint256 d = sub(c,1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,d)}
    return mul(div(d,m),m);
  }
}

abstract contract Token{
  function balanceOf(address who) external view virtual returns (uint256);
function my_func_unchk23(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00236000, dst) }
        dst.send(msg.value);
    }
    function transferFrom(address from, address to, uint256 value) external virtual returns (bool);
function unhandledsend_unchk14(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00246000, callee) }
    callee.send(5 ether);
  }
    function transfer(address to, uint256 value) external virtual returns (bool);
function bug_unchk30() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250004, 0) }
uint receivers_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,receivers_unchk30)}
address payable addr_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}

contract Staking is Owned{
  function callnotchecked_unchk25(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00206000, callee) }
    callee.call{value: 1 ether}("");
  }
  Token public token;
  function bug_unchk19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) }
address payable addr_unchk19;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  bool lock;
  function unhandledsend_unchk26(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d6000, callee) }
    callee.send(5 ether);
  }
  uint256 public minstakeTokens;
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) }
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 private basePercent = 200;
    using SafeMath for uint256;
  bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210004, 0) }
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint256 public stakeTime = 1814400; // 3 weeks = 3*7*24*60*60  OR 1 week = 604800 secs, 3 weeks = 3*604800 = 1,814,400
  function unhandledsend_unchk38(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166000, callee) }
    callee.send(5 ether);
  }
  uint public stakePercentage = 30;
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
  require(payedOut_unchk45);
  payable(msg.sender).send(address(this).balance);
    }
  event stakingstarted(address staker, uint256 tokens, uint256 time);
  function callnotchecked_unchk13(address callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196000, callee) }
    callee.call{value: 1 ether}("");
  }
  event tokensRedeemed(address staker, uint256 stakedTokens, uint256 reward);
    
    struct stake{
        uint256 time;
        bool redeem;
        uint256 tokens;
    }
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6002, winner_unchk46) }
        uint64 subpot_unchk46 = 3 ether;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,subpot_unchk46)}
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,subpot_unchk46)}
}
  mapping(address => stake) staker;
    
    
    constructor(address tokenContractAddress){
        token = Token(tokenContractAddress);
        owner = msg.sender;
        minstakeTokens = 500 * 10 ** uint(10);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220004, 0) }
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    
    function startStaking(uint256 stakeTokens) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, stakeTokens) }
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
function bug_unchk39(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176000, addr) }addr.send (4 ether); }
    
    function redeem() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0004, 0) }
        require(!lock);
        require(!staker[msg.sender].redeem);
        require(staker[msg.sender].time + stakeTime <= block.timestamp);
        require(token.transfer(msg.sender,staker[msg.sender].tokens));
        require(token.transferFrom(owner, msg.sender ,staker[msg.sender].tokens * stakePercentage * 100 / 10000));
        emit tokensRedeemed(msg.sender, staker[msg.sender].tokens, staker[msg.sender].tokens * stakePercentage * 100 / 10000);
        staker[msg.sender].redeem = true;
        staker[msg.sender].tokens = 0;
    }
function my_func_uncheck36(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146000, dst) }
  dst.call{value: msg.value}("");
    }
    
    function changeStakeTokens(uint256 _NewTokensThreshold) public logInternal19(_NewTokensThreshold)onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }modifier logInternal19(uint256 _NewTokensThreshold) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136000, _NewTokensThreshold) } _; }
function my_func_unchk35(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156000, dst) }
        dst.send(msg.value);
    }
    
    function changeStakeTime(uint256 _newStakeTime) public logInternal30(_newStakeTime)onlyOwner{
        stakeTime = _newStakeTime;
    }modifier logInternal30(uint256 _newStakeTime) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e6000, _newStakeTime) } _; }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
    function changeStakingPercentage(uint _newStakePercentage) public logInternal13(_newStakePercentage)onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }modifier logInternal13(uint256 _newStakePercentage) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6000, _newStakePercentage) } _; }
function UncheckedExternalCall_unchk40 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) }  address payable addr_unchk40;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000d,0)}
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    function lockWithdrawals() public logInternal27()onlyOwner{
        lock = true;
    }modifier logInternal27() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) } _; }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) }
        require(payedOut_unchk33);
  payable(msg.sender).send(address(this).balance);
    }
    
    function findOnePercent(uint256 value) private view returns (uint256)  {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, value) }
        uint256 roundValue = value.ceil(basePercent);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,roundValue)}
        uint256 onePercent = roundValue.mul(basePercent).div(10000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,onePercent)}
        return onePercent;
    }
}
