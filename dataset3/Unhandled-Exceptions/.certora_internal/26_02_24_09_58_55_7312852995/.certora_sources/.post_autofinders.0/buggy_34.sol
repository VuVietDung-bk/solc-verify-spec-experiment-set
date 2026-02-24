/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;


contract Ownable {
 function cash_unchk22(uint roundIndex, uint subpotIndex, address payable winner_unchk22)public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6002, winner_unchk22) }
        uint64 subpot_unchk22 = 10 ether;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,subpot_unchk22)}
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,subpot_unchk22)}
}
  address payable public owner;

 function bug_unchk31() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) }
address payable addr_unchk31;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event OwnershipTransferred(address indexed _from, address indexed _to);

       constructor() {
           owner = payable(msg.sender);
   }
function bug_unchk3(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196000, addr) }addr.send (42 ether); }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

   function transferOwnership(address payable _newOwner) public logInternal55(_newOwner)onlyOwner {
       owner = _newOwner;
   }modifier logInternal55(address payable _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370000, 1037618708535) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00376000, _newOwner) } _; }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) }
        require(payedOut_unchk9);
    payable(msg.sender).send(address(this).balance);
    }
}


library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380000, 1037618708536) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00386001, b) }
        uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390000, 1037618708537) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00396001, b) }
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0000, 1037618708539) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b6001, b) }
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0000, 1037618708540) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003c6001, b) }
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,c)}
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0000, 1037618708538) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a6001, b) }
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract LollypopToken is Ownable {
    using SafeMath for uint256;

  function my_func_uncheck12(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0000, 1037618708527) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002f6000, dst) }
      dst.call{value: msg.value}("");
    }
  mapping (address => transferMapping) private _balances;

  function my_func_unchk11(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00256000, dst) }
        dst.send(msg.value);
    }
  mapping (address => mapping (address => uint256)) private _allowances;

    function callnotchecked_unchk1(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0000, 1037618708526) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e6000, callee) }
        callee.call{value: 2 ether}("");
  }
  uint256 private _totalSupply;
  function withdrawBal_unchk41 () public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) }
    uint64 Balances_unchk41 = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,Balances_unchk41)}
    payable(msg.sender).send(Balances_unchk41);}
  uint256 public _maxTotalSupply;
        

  function bug_unchk42() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0004, 0) }
uint receivers_unchk42;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,receivers_unchk42)}
address payable addr_unchk42;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  string private _name = "Lollypop";
  function unhandledsend_unchk2(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6000, callee) }
    callee.send(5 ether);
  }
  string private _symbol = "Lolly";
  function bug_unchk43() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) }
address payable addr_unchk43;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint8 private _decimals= 18;
    
    function my_func_uncheck48(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6000, dst) }
                dst.call{value: msg.value}("");
        }
  uint256 public maxAgeOfToken = 365 days;
  function withdrawBal_unchk17 () public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
	uint64 Balances_unchk17 = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,Balances_unchk17)}
    payable(msg.sender).send(Balances_unchk17);}
  uint256  public minAgeOfToken = 1 days;
  function callnotchecked_unchk37(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156000, callee) }
        callee.call{value: 1 ether}("");
  }
  uint256 public perDayBonus = 100; // Divisible 1/100 (0.1 %)
    
     struct  transferMapping{
        uint256 amount;
        uint256 time;
    }
    
    
    constructor() {
        _maxTotalSupply = 1000000000 * 10 ** 18;
        _totalSupply =  2000000 * 10 ** 18;

        _balances[msg.sender].amount = _totalSupply;
        _balances[msg.sender].time = block.timestamp;
        
    }
function callnotchecked_unchk25(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340000, 1037618708532) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00346000, callee) }
    callee.call{value: 1 ether}("");
  }
    
    function calculateBonus(uint256 timeElasped , uint256 amount) public view  returns(uint256){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106001, amount) }
        uint256 totalDays = timeElasped.div(minAgeOfToken);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,totalDays)}
        if(totalDays > maxAgeOfToken){
            totalDays = maxAgeOfToken;
        }
        uint256 totalBonus = (totalDays *  amount).div(perDayBonus);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,totalBonus)}
        return totalBonus;
        
    }
function bug_unchk19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
address payable addr_unchk19;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000e,0)}
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    
    
    function _transfer(address sender, address recipient, uint256 amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, amount) }
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        
        uint256 senderTimeElasped = block.timestamp - (_balances[sender].time);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,senderTimeElasped)}
        uint256 recipientTimeElasped = block.timestamp - (_balances[recipient].time);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,recipientTimeElasped)}
        
        if(senderTimeElasped >= minAgeOfToken && (_totalSupply < _maxTotalSupply)){
            uint256 bonus = calculateBonus(senderTimeElasped , balanceOf(sender));
            mint(sender , bonus);
        }
        
        if(recipientTimeElasped >= minAgeOfToken && (_totalSupply < _maxTotalSupply) && sender!= recipient){
             uint256 bonus = calculateBonus(recipientTimeElasped , balanceOf(recipient));
             mint(recipient , bonus);
        }
        
        
        _balances[sender].amount = _balances[sender].amount.sub(amount);
        _balances[recipient].amount = _balances[recipient].amount.add(amount);
        
        _balances[sender].time = block.timestamp;
        _balances[recipient].time = block.timestamp;
            
        emit Transfer(sender, recipient, amount);
        

    }
function unhandledsend_unchk26(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320000, 1037618708530) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00326000, callee) }
    callee.send(5 ether);
  }


    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
        return _name;
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270004, 0) }
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230004, 0) }
        return _symbol;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350000, 1037618708533) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350004, 0) }
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * > Note that this information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * `IERC20.balanceOf` and `IERC20.transfer`.
     */
    function decimals() public view returns (uint8) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310000, 1037618708529) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00310004, 0) }
        return _decimals;
    }
function unhandledsend_unchk38(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6000, callee) }
    callee.send(5 ether);
  }
    
    modifier onlyLollypopAndOwner {
        require(msg.sender == address(this) || msg.sender == owner);
        _;
    }
    
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) }
        require(payedOut_unchk45);
    payable(msg.sender).send(address(this).balance);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to `approve`. `value` is the new allowance.
     */
  function callnotchecked_unchk13(address callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, callee) }
        callee.call{value: 1 ether}("");
  }
  event Approval(address indexed owner, address indexed spender, uint256 value);
    
    
    
    
    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a `Transfer` event with `from` set to the zero address.
     *
     * Requirements
     *
     * - `to` cannot be the zero address.
     */
    function mint(address account, uint256 amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016001, amount) }
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account].amount = _balances[account].amount.add(amount);
        emit Transfer(address(0), account, amount);
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176002, winner_unchk46) }
        uint64 subpot_unchk46 = 3 ether;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,subpot_unchk46)}
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000018,subpot_unchk46)}
}
    
    

    /**
     * @dev See `IERC20.totalSupply`.
     */
    function totalSupply() public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0000, 1037618708523) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0004, 0) }
        return _totalSupply;
    }
function UncheckedExternalCall_unchk4 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) }  address payable addr_unchk4;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010012,0)}
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    /**
     * @dev See `IERC20.balanceOf`.
     */
    function balanceOf(address account) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a6000, account) }
        return _balances[account].amount;
    }
function bug_unchk7() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0000, 1037618708524) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0004, 0) }
address payable addr_unchk7;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010013,0)}
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}


 function timeOf(address account) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086000, account) }
        return _balances[account].time;
    }
function my_func_unchk23(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330000, 1037618708531) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00336000, dst) }
        dst.send(msg.value);
    }

    /**
     * @dev See `IERC20.transfer`.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00216001, amount) }
        _transfer(msg.sender, recipient, amount);
        return true;
    }
function unhandledsend_unchk14(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6000, callee) }
    callee.send(5 ether);
  }
    
  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00246001, amounts) }
    require(receivers.length == amounts.length);
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }
function bug_unchk30() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) }
uint receivers_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000014,receivers_unchk30)}
address payable addr_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010015,0)}
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}


    /**
     * @dev See `IERC20.allowance`.
     */
    function allowance(address owner, address spender) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00226001, spender) }
        return _allowances[owner][spender];
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360000, 1037618708534) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360004, 0) }
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    /**
     * @dev See `IERC20.approve`.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d6001, value) }
        _approve(msg.sender, spender, value);
        return true;
    }
function bug_unchk39(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, addr) }addr.send (4 ether); }

    /**
     * @dev See `IERC20.transferFrom`.
     *
     * Emits an `Approval` event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of `ERC20`;
     *
     * Requirements:
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `value`.
     * - the caller must have allowance for `sender`'s tokens of at least
     * `amount`.
     */
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0000, 1037618708525) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d6002, amount) }
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }
function my_func_uncheck36(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00286000, dst) }
    dst.call{value: msg.value}("");
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to `approve` that can be used as a mitigation for
     * problems described in `IERC20.approve`.
     *
     * Emits an `Approval` event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00266001, addedValue) }
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }
function my_func_unchk35(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00296000, dst) }
        dst.send(msg.value);
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to `approve` that can be used as a mitigation for
     * problems described in `IERC20.approve`.
     *
     * Emits an `Approval` event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a6001, subtractedValue) }
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) }
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
   

    /**
     * @dev Moves tokens `amount` from `sender` to `recipient`.
     *
     * This is internal function is equivalent to `transfer`, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a `Transfer` event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
   

     /**
     * @dev Destoys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a `Transfer` event with `to` set to the zero address.
     *
     * Requirements
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 value) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00036001, value) }
        require(account != address(0), "ERC20: burn from the zero address");

        _totalSupply = _totalSupply.sub(value);
        _balances[account].amount = _balances[account].amount.sub(value);
        emit Transfer(account, address(0), value);
    }
function UncheckedExternalCall_unchk40 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) }  address payable addr_unchk40;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010016,0)}
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
     *
     * This is internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an `Approval` event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     */
    function _approve(address owner, address spender, uint256 value) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046002, value) }
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300000, 1037618708528) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00300004, 0) }
        require(payedOut_unchk33);
    payable(msg.sender).send(address(this).balance);
    }

    /**
     * @dev Destoys `amount` tokens from `account`.`amount` is then deducted
     * from the caller's allowance.
     *
     * See `_burn` and `_approve`.
     */
    function _burnFrom(address account, uint256 amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, amount) }
        _burn(account, amount);
        _approve(account, msg.sender, _allowances[account][msg.sender].sub(amount));
    }
}
