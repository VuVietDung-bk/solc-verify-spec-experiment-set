/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.7.0;

contract Ownable {
mapping(address => uint) balances_re_ent21;
  function withdraw_balances_re_ent21 () public {
     (bool success,)= payable(msg.sender).call{value: balances_re_ent21[msg.sender ]}("");
     if (success)
      balances_re_ent21[msg.sender] = 0;
    }
  address public owner;

mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
    (bool success,)=payable(msg.sender).call{value: userBalance_re_ent40[msg.sender]}("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor () {
    owner = msg.sender;
  }
address payable lastPlayer_re_ent9;
      uint jackpot_re_ent9;
      function buyTicket_re_ent9() public{
	    (bool success,) = payable(lastPlayer_re_ent9).call{value: jackpot_re_ent9}("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = payable(msg.sender);
      jackpot_re_ent9    = address(this).balance;
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
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }

}

contract TokenERC20 {
    // Public variables of the token
  mapping(address => uint) userBalance_re_ent12;
function withdrawBalance_re_ent12() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
    if( ! (payable(msg.sender).send(userBalance_re_ent12[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent12[msg.sender] = 0;
    }
  string public name;
  string public symbol;
  uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
  bool not_called_re_ent41 = true;
function bug_re_ent41() public{
        require(not_called_re_ent41);
    if( ! (payable(msg.sender).send(1 ether) ) ){
            revert();
        }
        not_called_re_ent41 = false;
    }
  uint256 public totalSupply;

    // This creates an array with all balances
  uint256 counter_re_ent42 =0;
function callme_re_ent42() public{
        require(counter_re_ent42<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent42 += 1;
    }
  mapping (address => uint256) public balanceOf;
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    if (!(lastPlayer_re_ent2.send(jackpot_re_ent2)))
        revert();
      lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
  event Transfer(address indexed from, address indexed to, uint256 value);
    
    // This generates a public event on the blockchain that will notify clients
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // This notifies clients about the amount burnt
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
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

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal virtual {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
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
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
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
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
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
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
}

/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract TTC is Ownable, TokenERC20 {

  mapping(address => uint) balances_re_ent17;
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition _weiToWithdraw >= 0
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,)=payable(msg.sender).call{value: _weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
  uint256 public sellPrice;
  uint256 public buyPrice;

  mapping (address => bool) public frozenAccount;

    /* This generates a public event on the blockchain that will notify clients */
  bool not_called_re_ent13 = true;
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event FrozenFunds(address target, bool frozen);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition initialSupply >= 0
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) TokenERC20(initialSupply, tokenName, tokenSymbol) {}

    /* Internal transfer, only can be called by this contract */
    function _transfer(address _from, address _to, uint _value) internal override {
        require (_to != address(0x0));                          // Prevent transfer to 0x0 address. Use burn() instead
        require (balanceOf[_from] >= _value);                   // Check if the sender has enough
        require (balanceOf[_to] + _value >= balanceOf[_to]);    // Check for overflows
        require(!frozenAccount[_from]);                         // Check if sender is frozen
        require(!frozenAccount[_to]);                           // Check if recipient is frozen
        balanceOf[_from] -= _value;                             // Subtract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
        emit Transfer(_from, _to, _value);
    }

    /// @notice Create `mintedAmount` tokens and send it to `target`
    /// @param target Address to receive the tokens
    /// @param mintedAmount the amount of tokens it will receive
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition mintedAmount >= 0
    function mintToken(address target, uint256 mintedAmount) onlyOwner public {
        balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), address(this), mintedAmount);
        emit Transfer(address(this), target, mintedAmount);
    }

    /// @notice `freeze? Prevent | Allow` `target` from sending & receiving tokens
    /// @param target Address to be frozen
    /// @param freeze either to freeze it or not
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    function freezeAccount(address target, bool freeze) onlyOwner public {
        frozenAccount[target] = freeze;
        emit FrozenFunds(target, freeze);
    }

    /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
    /// @param newSellPrice Price the users can sell to the contract
    /// @param newBuyPrice Price users can buy from the contract
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition newSellPrice >= 0
    /// @notice precondition newBuyPrice >= 0
    function setPrices(uint256 newSellPrice, uint256 newBuyPrice) onlyOwner public {
        sellPrice = newSellPrice;
        buyPrice = newBuyPrice;
    }

    /// @notice Buy tokens from contract by sending ether
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function buy() payable public {
        uint amount = msg.value / buyPrice;                 // calculates the amount
        _transfer(address(this), msg.sender, amount);       // makes the transfers
    }
mapping(address => uint) balances_re_ent36;
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition balances_re_ent36[msg.sender] > 0
    /// @notice postcondition balances_re_ent36[msg.sender] == 0
    /// @notice postcondition __verifier_old_uint(contract.balance) >= contract.balance && __verifier_old_uint(contract.balance) - contract.balance <= __verifier_old_uint(balances_re_ent36[msg.sender])
    function withdraw_balances_re_ent36 () public {
      if (payable(msg.sender).send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    /// @notice Sell `amount` tokens to contract
    /// @param amount amount of tokens to be sold
    /// @notice precondition forall (address extraVar0) balances_re_ent21[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent40[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent9 >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent12[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent42 >= 0
    /// @notice precondition forall (address extraVar0) balanceOf[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowance[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition sellPrice >= 0
    /// @notice precondition buyPrice >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent36[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function sell(uint256 amount) public {
        address myAddress = address(this);
        require(myAddress.balance >= amount * sellPrice);   // checks if the contract has enough ether to buy
        _transfer(msg.sender, address(this), amount);       // makes the transfers
        payable(msg.sender).transfer(amount * sellPrice);            // sends ether to the seller. It's important to do this last to avoid recursion attacks
    }
}
