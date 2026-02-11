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
    uint256 public totalSupply;

    function balanceOf(address _owner) public view virtual returns (uint256 balance);
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (payable(msg.sender).send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }

    function transfer(address _to, uint256 _value) public virtual returns (bool success);
address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
    lastPlayer_re_ent23 = payable(msg.sender);
      jackpot_re_ent23    = address(this).balance;
    }

    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
        function approve(address _spender, uint256 _value) public virtual returns (bool success);

    function allowance(address _owner, address _spender) public view virtual returns (uint256 remaining);
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = payable(msg.sender).call{value: balances_re_ent8[msg.sender ]}("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

    // solhint-disable-next-line no-simple-event-func-name
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
                require(payable(msg.sender).send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
                (bool success,)=payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract HotDollarsToken is EIP20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
  mapping(address => uint) userBalance_re_ent26;
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= payable(msg.sender).call{value: userBalance_re_ent26[msg.sender]}("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }
  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) public allowed;
    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
  mapping(address => uint) redeemableEther_re_ent32;
    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition redeemableEther_re_ent32[msg.sender] > 0
    /// @notice postcondition redeemableEther_re_ent32[msg.sender] == 0
    /// @notice postcondition __verifier_old_uint(address(this).balance) >= address(this).balance && __verifier_old_uint(address(this).balance) - address(this).balance <= __verifier_old_uint(redeemableEther_re_ent32[msg.sender])
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
    payable(msg.sender).transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  string public name;                   //fancy name: eg Simon Bucks
  uint8 public decimals;                //How many decimals to show.
  string public symbol;                 //An identifier: eg SBX

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor() {
        totalSupply = 3 * 1e28;                        
        name = "HotDollars Token";                          
        decimals = 18;                           
        symbol = "HDS";
        balances[msg.sender] = totalSupply; 
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    function transfer(address _to, uint256 _value) public override returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success) {
        uint256 allowedAmount = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowedAmount >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowedAmount < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function balanceOf(address _owner) public view override returns (uint256 balance) {
        return balances[_owner];
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _value >= 0
    function approve(address _spender, uint256 _value) public override returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    /// @notice precondition totalSupply >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition jackpot_re_ent23 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition MAX_UINT256 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent26[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent32[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function allowance(address _owner, address _spender) public view override returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}
