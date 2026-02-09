/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.7.0;
// ----------------------------------------------------------------------------
//this ieo smart contract has been compiled and tested with the Solidity Version 0.5.2
//There are some minor changes comparing to ieo contract compiled with versions < 0.5.0
// ----------------------------------------------------------------------------

abstract contract ERC20Interface {
    function totalSupply() public view virtual returns (uint);
mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        (bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");
        require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
    }
    function balanceOf(address tokenOwner) public view virtual returns (uint balance);
address payable lastPlayer_re_ent37;
      uint jackpot_re_ent37;
	  function buyTicket_re_ent37() public{
	    (bool sent,) = lastPlayer_re_ent37.call{value: jackpot_re_ent37}("");
                if (!sent)
                revert();
            lastPlayer_re_ent37 = payable(msg.sender);
      jackpot_re_ent37    = address(this).balance;
    }
    function transfer(address to, uint tokens) public virtual returns (bool success);

    
    function allowance(address tokenOwner, address spender) public view virtual returns (uint remaining);
    function approve(address spender, uint tokens) public virtual returns (bool success);
    function transferFrom(address from, address to, uint tokens) public virtual returns (bool success);
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,) = payable(msg.sender).call{value: userBalance_re_ent19[msg.sender]}("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract AcunarToken is ERC20Interface{
  bool not_called_re_ent6 = true;
function bug_re_ent6() public{
        require(not_called_re_ent6);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent6 = false;
    }
  string public name = "Acunar";
  string public symbol = "ACN";
  mapping(address => uint) balances_re_ent24;
function withdrawFunds_re_ent24 (uint256 _weiToWithdraw) public {
        require(balances_re_ent24[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");  //bug
    require(sent, "send failed");
        balances_re_ent24[msg.sender] -= _weiToWithdraw;
    }
  uint public decimals = 0;
    
  uint public supply;
  mapping(address => uint) balances_re_ent15;
    function withdraw_balances_re_ent15 () public {
         (bool sent,) = payable(msg.sender).call{value: balances_re_ent15[msg.sender ]}("");
         if (sent)
          balances_re_ent15[msg.sender] = 0;
      }
  address public founder;
    
  uint256 counter_re_ent28 =0;
function callme_re_ent28() public{
        require(counter_re_ent28<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");
        if( ! success ){
            revert();
        }
        counter_re_ent28 += 1;
    }
  mapping(address => uint) public balances;
    
  mapping(address => mapping(address => uint)) allowed;
    
    //allowed[0x1111....][0x22222...] = 100;
    
    
    constructor(){
        supply = 200000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
    
    
    function allowance(address tokenOwner, address spender) view public override returns(uint){
        return allowed[tokenOwner][spender];
    }
    
    
    //approve allowance
    function approve(address spender, uint tokens) public override returns(bool){
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);
        
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    //transfer tokens from the  owner account to the account that calls the function
    function transferFrom(address from, address to, uint tokens) public override virtual returns(bool){
        require(allowed[from][to] >= tokens);
        require(balances[from] >= tokens);
        
        balances[from] -= tokens;
        balances[to] += tokens;
        
        
        allowed[from][to] -= tokens;
        
        return true;
    }
    
    function totalSupply() public view override returns (uint){
        return supply;
    }
    
    function balanceOf(address tokenOwner) public view override returns (uint balance){
         return balances[tokenOwner];
     }
     
     
    function transfer(address to, uint tokens) public override virtual returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);
         
         balances[to] += tokens;
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
}


contract AcunarIEO is AcunarToken{
  address public admin;
    
    
    //starting with solidity version 0.5.0 only a payable address has the transfer() member function
    //it's mandatory to declare the variable payable
  address payable public deposit;
    
    //token price in wei: 1 ACN = 0.0001 ETHER, 1 ETHER = 10000 ACN
  uint tokenPrice = 0.0001 ether;
    
    //300 Ether in wei
  uint public hardCap =21000 ether;
    
  uint public raisedAmount;
    
    uint public saleStart = block.timestamp;
        uint public saleEnd = block.timestamp + 14515200; //24 week
        uint public coinTradeStart = saleEnd + 15120000; //transferable in a week after salesEnd
    
  uint public maxInvestment = 30 ether;
  uint public minInvestment = 0.1 ether;
    
    enum State { beforeStart, running, afterEnd, halted}
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
	  function buyTicket_re_ent2() public{
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  State public ieoState;
    
    
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }
    
  bool not_called_re_ent13 = true;
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event Invest(address investor, uint value, uint tokens);
    
    
    //in solidity version > 0.5.0 the deposit argument must be payable
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    constructor(address payable _deposit){
        deposit = _deposit;
        admin = msg.sender;
        ieoState = State.beforeStart;
    }
    
    //emergency stop
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    function halt() public onlyAdmin{
        ieoState = State.halted;
    }
    
    //restart 
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    function unhalt() public onlyAdmin{
        ieoState = State.running;
    }
    
    
    //only the admin can change the deposit address
    //in solidity version > 0.5.0 the deposit argument must be payable
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    function changeDepositAddress(address payable newDeposit) public onlyAdmin{
        deposit = newDeposit;
    }
    
    
    //returns ieo state
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    function getCurrentState() public view returns(State){
        if(ieoState == State.halted){
            return State.halted;
        }else if(block.timestamp < saleStart){
            return State.beforeStart;
        }else if(block.timestamp >= saleStart && block.timestamp <= saleEnd){
            return State.running;
        }else{
            return State.afterEnd;
        }
    }
    
    
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function invest() payable public returns(bool){
        //invest only in running
        ieoState = getCurrentState();
        require(ieoState == State.running);
        
        require(msg.value >= minInvestment && msg.value <= maxInvestment);
        
        uint tokens = msg.value / tokenPrice;
        
        //hardCap not reached
        require(raisedAmount + msg.value <= hardCap);
        
        raisedAmount += msg.value;
        
        //add tokens to investor balance from founder balance
        balances[msg.sender] += tokens;
        balances[founder] -= tokens;
        
        deposit.transfer(msg.value);//transfer eth to the deposit address
        
        //emit event
        emit Invest(msg.sender, msg.value, tokens);
        
        return true;
        

    }
    
    //the payable function must be declared external in solidity versions > 0.5.0
    receive() external payable {
        invest();
    }
    
    
    
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    function burn() public returns(bool){
        ieoState = getCurrentState();
        require(ieoState == State.afterEnd);
        balances[founder] = 0;
        
    }
    
    
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition value >= 0
    function transfer(address to, uint value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transfer(to, value);
    }
    
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition jackpot_re_ent37 >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent24[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent15[extraVar0] >= 0
    /// @notice precondition counter_re_ent28 >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition tokenPrice >= 0
    /// @notice precondition hardCap >= 0
    /// @notice precondition raisedAmount >= 0
    /// @notice precondition saleStart >= 0
    /// @notice precondition saleEnd >= 0
    /// @notice precondition coinTradeStart >= 0
    /// @notice precondition maxInvestment >= 0
    /// @notice precondition minInvestment >= 0
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition _value >= 0
    function transferFrom(address _from, address _to, uint _value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transferFrom(_from, _to, _value);
    }
    
}
