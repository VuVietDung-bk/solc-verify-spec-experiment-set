/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.7.0;


contract Ownable {
 mapping(address => uint) balances_re_ent15;
     function withdraw_balances_re_ent15 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) }
         if (payable(msg.sender).send(balances_re_ent15[msg.sender ]))
          balances_re_ent15[msg.sender] = 0;
      }
  address payable public owner;

 bool not_called_re_ent27 = true;
function bug_re_ent27() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170004, 0) }
        require(not_called_re_ent27);
        if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event OwnershipTransferred(address indexed _from, address indexed _to);

   constructor() {
       owner = payable(msg.sender);
   }
address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0004, 0) }
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }

   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }

   function transferOwnership(address payable _newOwner) public logInternal37(_newOwner)onlyOwner {
       owner = _newOwner;
   }modifier logInternal37(address payable _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00256000, _newOwner) } _; }
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00226000, _weiToWithdraw) }
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool success,)=payable(msg.sender).call{value:_weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
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
    function add(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00266001, b) }
        uint256 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,c)}
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
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00276001, b) }
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,c)}

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
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00296001, b) }
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,c)}
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
    function div(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a6001, b) }
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,c)}
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
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00286001, b) }
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

contract LollypopToken is Ownable {
    using SafeMath for uint256;

  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230004, 0) }
        require(counter_re_ent28<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  mapping (address => transferMapping) private _balances;

  bool not_called_re_ent34 = true;
function bug_re_ent34() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
        require(not_called_re_ent34);
        if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent34 = false;
    }
  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 counter_re_ent21 =0;
function callme_re_ent21() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180004, 0) }
        require(counter_re_ent21<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent21 += 1;
    }
  uint256 private _totalSupply;
  mapping(address => uint) balances_re_ent10;
function withdrawFunds_re_ent10 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, _weiToWithdraw) }
        require(balances_re_ent10[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent10[msg.sender] -= _weiToWithdraw;
    }
  uint256 public _maxTotalSupply;
        

  mapping(address => uint) balances_re_ent21;
    function withdraw_balances_re_ent21 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240004, 0) }
         (bool success,)= payable(msg.sender).call{value:balances_re_ent21[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010006,0)}
       if (success)
          balances_re_ent21[msg.sender] = 0;
      }
  string private _name = "Lollypop";
  mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (payable(msg.sender).send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
  string private _symbol = "Lolly";
  mapping(address => uint) redeemableEther_re_ent11;
function claimReward_re_ent11() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent11[msg.sender] > 0);
        uint transferValue_re_ent11 = redeemableEther_re_ent11[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,transferValue_re_ent11)}
    payable(msg.sender).transfer(transferValue_re_ent11);   //bug
        redeemableEther_re_ent11[msg.sender] = 0;
    }
  uint8 private _decimals= 18;
    
  mapping(address => uint) balances_re_ent1;
    function withdraw_balances_re_ent1 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
    (bool success,) =payable(msg.sender).call{value:balances_re_ent1[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
       if (success)
          balances_re_ent1[msg.sender] = 0;
      }
  uint256 public maxAgeOfToken = 365 days;
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) }
        require(not_called_re_ent41);
        if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  uint256  public minAgeOfToken = 1 days;
  uint256 counter_re_ent42 =0;
function callme_re_ent42() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
        require(counter_re_ent42<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
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

    function calculateBonus(uint256 timeElasped , uint256 amount) public view  returns(uint256){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6001, amount) }
        uint256 totalDays = timeElasped.div(minAgeOfToken);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,totalDays)}
        if(totalDays > maxAgeOfToken){
            totalDays = maxAgeOfToken;
        }
        uint256 totalBonus = (totalDays *  amount).div(perDayBonus);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,totalBonus)}
        return totalBonus;
        
    }
    
    
    function _transfer(address sender, address recipient, uint256 amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, amount) }
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        
        uint256 senderTimeElasped = block.timestamp - (_balances[sender].time);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,senderTimeElasped)}
        uint256 recipientTimeElasped = block.timestamp - (_balances[recipient].time);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,recipientTimeElasped)}
        
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
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) }
        (bool success,) = lastPlayer_re_ent9.call{value:jackpot_re_ent9}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000d,0)}
	    if (!success)
	        revert();
            lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
    }


    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) }
        return _symbol;
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
    function decimals() public view returns (uint8) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210004, 0) }
        return _decimals;
    }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= payable(msg.sender).call{value:userBalance_re_ent26[msg.sender]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000e,0)}
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
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
  event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to `approve`. `value` is the new allowance.
     */
bool not_called_re_ent13 = true;
function bug_re_ent13() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
        require(not_called_re_ent13);
	(bool success,)=payable(msg.sender).call{value:1 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000f,0)}
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
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
    
    

    /**
     * @dev See `IERC20.totalSupply`.
     */
    function totalSupply() public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) }
        return _totalSupply;
    }

    /**
     * @dev See `IERC20.balanceOf`.
     */
    function balanceOf(address account) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, account) }
        return _balances[account].amount;
    }


 function timeOf(address account) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086000, account) }
        return _balances[account].time;
    }

    /**
     * @dev See `IERC20.transfer`.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136001, amount) }
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    
  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166001, amounts) }
    require(receivers.length == amounts.length);
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }


    /**
     * @dev See `IERC20.allowance`.
     */
    function allowance(address owner, address spender) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146001, spender) }
        return _allowances[owner][spender];
    }

    /**
     * @dev See `IERC20.approve`.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126001, value) }
        _approve(msg.sender, spender, value);
        return true;
    }

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
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6002, amount) }
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
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
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6001, addedValue) }
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
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
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6001, subtractedValue) }
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
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
