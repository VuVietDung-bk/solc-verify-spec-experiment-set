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
mapping(address => uint) public lockTime_intou17;

function increaseLockTime_intou17(uint _secondsToIncrease) public {
        lockTime_intou17[msg.sender] += _secondsToIncrease;  //overflow
    }
function withdraw_intou17() public {
    require(block.timestamp > lockTime_intou17[msg.sender]);    
    uint transferValue_intou17 = 10;           
    payable(msg.sender).transfer(transferValue_intou17);
    }
    function balanceOf(address tokenOwner) public view virtual returns (uint balance);
    function transfer(address to, uint tokens) public virtual returns (bool success);
    function allowance(address tokenOwner, address spender) public view virtual returns (uint remaining);
    function approve(address spender, uint tokens) public virtual returns (bool success);
    function transferFrom(address from, address to, uint tokens) public virtual returns (bool success);
function bug_intou3() public{
    uint8 vundflw =0;
    vundflw = vundflw -10;   // underflow bug
}
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract AcunarToken is ERC20Interface{
    mapping(address => uint) balances_intou18;

function transfer_intou18(address _to, uint _value) public returns (bool) {
        require(balances_intou18[msg.sender] - _value >= 0);  //bug
        balances_intou18[msg.sender] -= _value;  //bug
        balances_intou18[_to] += _value;  //bug
        return true;
    }
  string public name = "Acunar";
  string public symbol = "ACN";
  uint public decimals = 0;
  uint public supply;
  address public founder;
  mapping(address => uint) public balances;
  mapping(address => mapping(address => uint)) allowed;
    
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
    function transferFrom(address from, address to, uint tokens) public virtual override returns(bool){
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
     
     
    function transfer(address to, uint tokens) public virtual override returns (bool success){
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
  State public ieoState;
    
    
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }
    
  event Invest(address investor, uint value, uint tokens);
    
    
    //in solidity version > 0.5.0 the deposit argument must be payable
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor(address payable _deposit) {
        deposit = _deposit;
        admin = msg.sender;
        ieoState = State.beforeStart;
    }
    
    //emergency stop
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function halt() public onlyAdmin{
        ieoState = State.halted;
    }
    
    //restart 
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function unhalt() public onlyAdmin{
        ieoState = State.running;
    }
    
    
    //only the admin can change the deposit address
    //in solidity version > 0.5.0 the deposit argument must be payable
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function changeDepositAddress(address payable newDeposit) public onlyAdmin{
        deposit = newDeposit;
    }
    
    
    //returns ieo state
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
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
    
    
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function invest() public payable returns(bool){
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
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable{
        invest();
    }
    
    
    
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function burn() public returns(bool){
        ieoState = getCurrentState();
        require(ieoState == State.afterEnd);
        balances[founder] = 0;
        
    }
    
    
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition value >= 0
    function transfer(address to, uint value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        return super.transfer(to, value);
    }
    
    /// @notice precondition forall (address extraVar0) lockTime_intou17[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) balances_intou18[extraVar0] >= 0
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
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
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition _value >= 0
    function transferFrom(address _from, address _to, uint _value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        return super.transferFrom(_from, _to, _value);
    }
    
}
