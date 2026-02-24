/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.7.0;

contract Ownable {
function bug_unchk42() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
uint receivers_unchk42;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,receivers_unchk42)}
address payable addr_unchk42;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  address public owner;

bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        require(payedOut_unchk33);
  payable(msg.sender).send(address(this).balance);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor () {
    owner = msg.sender;
  }
function unhandledsend_unchk26(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046000, callee) }
    callee.send(5 ether);
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public logInternal8(newOwner)onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }modifier logInternal8(address newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086000, newOwner) } _; }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

}

contract TokenERC20 {
    // Public variables of the token
  function unhandledsend_unchk2(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6000, callee) }
    callee.send(5 ether);
  }
  string public name;
  function bug_unchk43() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) }
address payable addr_unchk43;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  string public symbol;
  function my_func_uncheck48(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a6000, dst) }
      dst.call{value: msg.value}("");
    }
  uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
  function withdrawBal_unchk17 () public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
	uint64 Balances_unchk17 = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,Balances_unchk17)}
    payable(msg.sender).send(Balances_unchk17);}
  uint256 public totalSupply;

    // This creates an array with all balances
  function callnotchecked_unchk37(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166000, callee) }
    callee.call{value: 1 ether}("");
  }
  mapping (address => uint256) public balanceOf;
  function bug_unchk3(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00186000, addr) }addr.send (42 ether); }
  mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
  event Transfer(address indexed from, address indexed to, uint256 value);
    
    // This generates a public event on the blockchain that will notify clients
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // This notifies clients about the amount burnt
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }
        require(payedOut_unchk45);
  payable(msg.sender).send(address(this).balance);
    }
  event Burn(address indexed from, uint256 value);

    /**
     * Constrctor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    constructor(
      uint256 initialSupply,
      string memory tokenName,
      string memory tokenSymbol
    ) {
        totalSupply = initialSupply * 1000000000000000000;  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                    // Give the creator all initial tokens
        name = tokenName;                                       // Set the name for display purposes
        symbol = tokenSymbol;                                   // Set the symbol for display purposes
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280004, 0) }
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a6002, _value) }
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,previousBalances)}
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
function unhandledsend_unchk38(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6000, callee) }
    callee.send(5 ether);
  }

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6001, _value) }
        _transfer(msg.sender, _to, _value);
        return true;
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176002, winner_unchk46) }
        uint64 subpot_unchk46 = 3 ether;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,subpot_unchk46)}
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,subpot_unchk46)}
}

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` in behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00226002, _value) }
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
function UncheckedExternalCall_unchk4 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) }  address payable addr_unchk4;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens in your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6001, _value) }
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk7() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230004, 0) }
address payable addr_unchk7;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * Set allowance for other address and notify
     

    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00256000, _value) }
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
function my_func_unchk23(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00266000, dst) }
        dst.send(msg.value);
    }

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a6001, _value) }
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
function unhandledsend_unchk14(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6000, callee) }
    callee.send(5 ether);
  }
}

/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract TTC is Ownable, TokenERC20 {

  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) }
        require(payedOut_unchk9);
  payable(msg.sender).send(address(this).balance);
    }
  uint256 public sellPrice;
  function callnotchecked_unchk25(address payable callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00276000, callee) }
    callee.call{value: 1 ether}("");
  }
  uint256 public buyPrice;

  function bug_unchk19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
address payable addr_unchk19;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  mapping (address => bool) public frozenAccount;

    /* This generates a public event on the blockchain that will notify clients */
  function callnotchecked_unchk13(address callee) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116000, callee) }
    callee.call{value: 1 ether}("");
  }
  event FrozenFunds(address target, bool frozen);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) public {}
function bug_unchk30() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150004, 0) }
uint receivers_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,receivers_unchk30)}
address payable addr_unchk30;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal override {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056002, _value) }
        require (_to != address(0x0));                          // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                   // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!frozenAccount[_from]);                         // Check if sender is frozen
        require(!frozenAccount[_to]);                           // Check if recipient is frozen
        balanceOf[_from] -= _value;                             // Subtract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290004, 0) }
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    /// @notice Create `mintedAmount` tokens and send it to `target`
    /// @param target Address to receive the tokens
    /// @param mintedAmount the amount of tokens it will receive
    function mintToken(address target, uint256 mintedAmount) logInternal36(mintedAmount)onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), address(this), mintedAmount);
        emit Transfer(address(this), target, mintedAmount);
    }modifier logInternal36(uint256 mintedAmount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00246001, mintedAmount) } _; }
function bug_unchk39(address payable addr) public
      {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6000, addr) }addr.send (4 ether); }

    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address target, bool freeze) logInternal13(freeze)onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }modifier logInternal13(bool freeze) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6001, freeze) } _; }
function my_func_uncheck36(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00206000, dst) }
    dst.call{value: msg.value}("");
    }

    /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
    /// @param newSellPrice Price the users can sell to the contract
    /// @param newBuyPrice Price users can buy from the contract
    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) logInternal19(newBuyPrice)onlyOwner public {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }modifier logInternal19(uint256 newBuyPrice) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136001, newBuyPrice) } _; }
function my_func_unchk35(address payable dst) public payable{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00216000, dst) }
        dst.send(msg.value);
    }

    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) }
        uint amount = msg.value / buyPrice;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,amount)}                 // calculates the amount
        _transfer(address(this), msg.sender, amount);       // makes the transfers
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) }
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196000, amount) }
        address myAddress = address(this);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,myAddress)}
        require(myAddress.balance >= amount * sellPrice);   // checks if the contract has enough ether to buy
        _transfer(msg.sender, address(this), amount);       // makes the transfers
        payable(msg.sender).transfer(amount * sellPrice);   // sends ether to the seller. It's important to do this last to avoid recursion attacks
    }
function UncheckedExternalCall_unchk40 () public
{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }  address payable addr_unchk40;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000e,0)}
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}