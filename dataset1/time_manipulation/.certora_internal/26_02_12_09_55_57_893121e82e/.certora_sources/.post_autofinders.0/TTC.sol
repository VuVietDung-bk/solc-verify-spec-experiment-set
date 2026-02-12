/*
 * @source: https://github.com/DependableSystemsLab/SolidiFI-benchmark/blob/master/buggy_contracts/Timestamp-Dependency/buggy_10.sol
 * @author: -
 * @vulnerable_at_lines: 31,58
 */


pragma solidity >=0.7.0;

contract Ownable {
function bug_tmstmp1() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
    return block.timestamp >= 1546300800;
  }
  address public owner;

uint256 bugv_tmstmp5 = block.timestamp;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor () {
    owner = msg.sender;
  }
function bug_tmstmp32 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
	uint pastBlockTime_tmstmp32;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,pastBlockTime_tmstmp32)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
    // <yes> <report> TIME_MANIPULATION
        require(block.timestamp != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,pastBlockTime_tmstmp32)}       //bug
        if(block.timestamp % 15 == 0) { // winner    //bug
          payable(msg.sender).transfer(address(this).balance);
        }
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
  function transferOwnership(address newOwner) public logInternal6(newOwner)onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }modifier logInternal6(address newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00066000, newOwner) } _; }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, startTime) }
    // <yes> <report> TIME_MANIPULATION
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}

}

contract TokenERC20 {
    // Public variables of the token
  address winner_tmstmp2;
function play_tmstmp2(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00246000, startTime) }
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp2 = msg.sender;}}
  string public name;
  function bug_tmstmp17() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0004, 0) }
    return block.timestamp >= 1546300800;
  }
  string public symbol;
  function bug_tmstmp37() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160004, 0) }
    return block.timestamp >= 1546300800;
  }
  uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
  address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00226000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
  uint256 public totalSupply;

    // This creates an array with all balances
  function bug_tmstmp9() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170004, 0) }
    return block.timestamp >= 1546300800;
  }
  mapping (address => uint256) public balanceOf;
  function bug_tmstmp25() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0004, 0) }
    return block.timestamp >= 1546300800;
  }
  mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
  uint256 bugv_tmstmp1 = block.timestamp;
  event Transfer(address indexed from, address indexed to, uint256 value);
    
    // This generates a public event on the blockchain that will notify clients
  uint256 bugv_tmstmp2 = block.timestamp;
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // This notifies clients about the amount burnt
  uint256 bugv_tmstmp3 = block.timestamp;
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
function bug_tmstmp4 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) }
	uint pastBlockTime_tmstmp4;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,pastBlockTime_tmstmp4)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,pastBlockTime_tmstmp4)}       //bug
        if(block.timestamp % 15 == 0) { // winner    //bug
          payable(msg.sender).transfer(address(this).balance);
        }
    }

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00276002, _value) }
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,previousBalances)}
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156001, _value) }
        _transfer(msg.sender, _to, _value);
        return true;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` in behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6002, _value) }
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, startTime) }
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens in your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136001, _value) }
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6000, startTime) }
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}

    /**
     * Set allowance for other address and notify
     

    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00216000, _value) }
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
function bug_tmstmp8 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230000, 1037618708515) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00230004, 0) }
	uint pastBlockTime_tmstmp8;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,pastBlockTime_tmstmp8)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
    require(block.timestamp != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
    pastBlockTime_tmstmp8 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000014,pastBlockTime_tmstmp8)}       //bug
    if(block.timestamp % 15 == 0) { // winner    //bug
      payable(msg.sender).transfer(address(this).balance);
        }
    }

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00086001, _value) }
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
}

/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract TTC is Ownable, TokenERC20 {

  address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  uint256 public sellPrice;
  address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d6000, startTime) }
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
  uint256 public buyPrice;

  function bug_tmstmp20 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) }
	uint pastBlockTime_tmstmp20;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,pastBlockTime_tmstmp20)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
      require(block.timestamp != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
      pastBlockTime_tmstmp20 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000015,pastBlockTime_tmstmp20)}       //bug
      if(block.timestamp % 15 == 0) { // winner    //bug
        payable(msg.sender).transfer(address(this).balance);
        }
    }
  mapping (address => bool) public frozenAccount;

    /* This generates a public event on the blockchain that will notify clients */
  uint256 bugv_tmstmp4 = block.timestamp;
  event FrozenFunds(address target, bool frozen);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor(
      uint256 initialSupply,
      string memory tokenName,
      string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) {}
function bug_tmstmp36 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190004, 0) }
	uint pastBlockTime_tmstmp36;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,pastBlockTime_tmstmp36)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
      require(block.timestamp != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
      pastBlockTime_tmstmp36 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000016,pastBlockTime_tmstmp36)}       //bug
      if(block.timestamp % 15 == 0) { // winner    //bug
        payable(msg.sender).transfer(address(this).balance);
        }
    }

    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal override {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046002, _value) }
        require (_to != address(0x0));                          // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                   // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!frozenAccount[_from]);                         // Check if sender is frozen
        require(!frozenAccount[_to]);                           // Check if recipient is frozen
        balanceOf[_from] -= _value;                             // Subtract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00266000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}

    /// @notice Create `mintedAmount` tokens and send it to `target`
    /// @param target Address to receive the tokens
    /// @param mintedAmount the amount of tokens it will receive
    function mintToken(address target, uint256 mintedAmount) logInternal32(mintedAmount)onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), address(this), mintedAmount);
        emit Transfer(address(this), target, mintedAmount);
    }modifier logInternal32(uint256 mintedAmount) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00206001, mintedAmount) } _; }
function bug_tmstmp40 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250004, 0) }
	uint pastBlockTime_tmstmp40;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,pastBlockTime_tmstmp40)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
    require(block.timestamp != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
    pastBlockTime_tmstmp40 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,pastBlockTime_tmstmp40)}       //bug
    if(block.timestamp % 15 == 0) { // winner    //bug
      payable(msg.sender).transfer(address(this).balance);
        }
    }

    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    function freezeAccount(address target, bool freeze) logInternal12(freeze)onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }modifier logInternal12(bool freeze) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6001, freeze) } _; }
function bug_tmstmp33() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0000, 1037618708490) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000a0004, 0) }
    return block.timestamp >= 1546300800;
  }

    /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
    /// @param newSellPrice Price the users can sell to the contract
    /// @param newBuyPrice Price users can buy from the contract
    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) logInternal14(newBuyPrice)onlyOwner public {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }modifier logInternal14(uint256 newBuyPrice) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6001, newBuyPrice) } _; }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}

    /// @notice Buy tokens from contract by sending ether
    function buy() payable public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140004, 0) }
        uint amount = msg.value / buyPrice;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,amount)}                 // calculates the amount
        _transfer(address(this), msg.sender, amount);       // makes the transfers
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00186000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    function sell(uint256 amount) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, amount) }
        address myAddress = address(this);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,myAddress)}
        require(myAddress.balance >= amount * sellPrice);   // checks if the contract has enough ether to buy
        _transfer(msg.sender, address(this), amount);       // makes the transfers
        payable(msg.sender).transfer(amount * sellPrice);            // sends ether to the seller. It's important to do this last to avoid recursion attacks
    }
function bug_tmstmp13() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0004, 0) }
    return block.timestamp >= 1546300800;
  }
}