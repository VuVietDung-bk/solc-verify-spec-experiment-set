/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;

contract Owned {
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  address public owner;
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036000, _weiToWithdraw) }
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=payable(msg.sender).call{value:_weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  address public newOwner;

  bool not_called_re_ent27 = true;
function bug_re_ent27() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
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
function claimReward_re_ent32() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,transferValue_re_ent32)}
        payable(msg.sender).transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public logInternal14(_newOwner)onlyOwner {
        newOwner = _newOwner;
    }modifier logInternal14(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, _newOwner) } _; }
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, _weiToWithdraw) }
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066001, b) }
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
    require(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076001, b) }
    uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096001, b) }
    require(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6001, b) }
    uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
    require(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, m) }
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
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
    function buyTicket_re_ent9() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
      (bool success,) = lastPlayer_re_ent9.call{value:jackpot_re_ent9}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }
  uint256 public minstakeTokens;
  uint256 private basePercent = 200;
    using SafeMath for uint256;
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (payable(msg.sender).send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
  uint256 public stakeTime = 1814400; // 3 weeks = 3*7*24*60*60  OR 1 week = 604800 secs, 3 weeks = 3*604800 = 1,814,400
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= payable(msg.sender).call{value:userBalance_re_ent26[msg.sender]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
  uint public stakePercentage = 30;
  event stakingstarted(address staker, uint256 tokens, uint256 time);
bool not_called_re_ent13 = true;
function bug_re_ent13() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) }
        require(not_called_re_ent13);
        (bool success,)=payable(msg.sender).call{value:1 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
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
    
    
    constructor(address tokenContractAddress){
        token = Token(tokenContractAddress);
        owner = msg.sender;
        minstakeTokens = 500 * 10 ** uint(10);
    }
    
    function startStaking(uint256 stakeTokens) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, stakeTokens) }
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = block.timestamp;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
    
    function redeem() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170004, 0) }
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
    function withdraw_balances_re_ent8 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
      (bool success,) = payable(msg.sender).call{value:balances_re_ent8[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
    
    function changeStakeTokens(uint256 _NewTokensThreshold) public logInternal18(_NewTokensThreshold)onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }modifier logInternal18(uint256 _NewTokensThreshold) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, _NewTokensThreshold) } _; }
    
    function changeStakeTime(uint256 _newStakeTime) public logInternal22(_newStakeTime)onlyOwner{
        stakeTime = _newStakeTime;
    }modifier logInternal22(uint256 _newStakeTime) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166000, _newStakeTime) } _; }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) }
         if (payable(msg.sender).send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
    
    function changeStakingPercentage(uint _newStakePercentage) public logInternal12(_newStakePercentage)onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }modifier logInternal12(uint256 _newStakePercentage) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6000, _newStakePercentage) } _; }
    
    function lockWithdrawals() public logInternal20()onlyOwner{
        lock = true;
    }modifier logInternal20() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) } _; }
    
    function findOnePercent(uint256 value) private view returns (uint256)  {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, value) }
        uint256 roundValue = value.ceil(basePercent);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,roundValue)}
        uint256 onePercent = roundValue.mul(basePercent).div(10000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,onePercent)}
        return onePercent;
    }
}
