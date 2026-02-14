/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.7.0;
abstract contract EIP20Interface {
    /* This is a slight change to the ERC20 base standard.
    function totalSupply() constant returns (uint256 supply);
    is replaced with:
    uint256 public totalSupply;
    This automatically creates a getter function for the totalSupply.
    This is moved to the base contract since public getter functions are not
    currently recognised as an implementation of the matching abstract
    function by the compiler.
    */
    /// total amount of tokens
    uint256 public totalSupply;

    /// @param _owner The address from which the balance will be retrieved
    /// @return balance The balance
    function balanceOf(address _owner) public view virtual returns (uint256 balance);
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }

    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return success Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) public virtual returns (bool success);
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return success Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    /// @return success Whether the approval was successful or not
    function approve(address _spender, uint256 _value) public virtual returns (bool success);
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return remaining Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) public view virtual returns (uint256 remaining);
function my_func_uncheck36(address payable dst) public payable{
  dst.call{value: msg.value}("");
    }

    // solhint-disable-next-line no-simple-event-func-name
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function callnotchecked_unchk13(address callee) public {
    callee.call{value: 1 ether}("");
  }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract HotDollarsToken is EIP20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
  function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
  mapping (address => uint256) public balances;
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition roundIndex >= 0
    /// @notice precondition subpotIndex >= 0
  function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping (address => mapping (address => uint256)) public allowed;
    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
  function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string public name;                   //fancy name: eg Simon Bucks
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
  function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  uint8 public decimals;                //How many decimals to show.
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
  function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
  string public symbol;                 //An identifier: eg SBX

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    constructor() {
        totalSupply = 3 * 1e28;                        
        name = "HotDollars Token";                          
        decimals = 18;                           
        symbol = "HDS";
        balances[msg.sender] = totalSupply; 
    }
    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    /// @notice postcondition true
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition _value >= 0
    function transfer(address _to, uint256 _value) public override returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition _value >= 0
    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success) {
        uint256 currentAllowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && currentAllowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (currentAllowance < MAX_UINT256) {
          allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    function balanceOf(address _owner) public view override returns (uint256 balance) {
        return balances[_owner];
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition _value >= 0
    function approve(address _spender, uint256 _value) public override returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition winAmount_unchk8 >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition decimals >= 0
    function allowance(address _owner, address _spender) public view override returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
