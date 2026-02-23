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
function balanceOf(address tokenOwner) public view virtual returns (uint balance);
function transfer(address to, uint tokens) public virtual returns (bool success);
function allowance(address tokenOwner, address spender) public view virtual returns (uint remaining);
function approve(address spender, uint tokens) public virtual returns (bool success);
function transferFrom(address from, address to, uint tokens) public virtual returns (bool success);
}

/// @notice invariant raisedAmount <= hardCap
contract AcunarToken is ERC20Interface{
    string public name = "Acunar";
    string public symbol = "ACN";
    uint public decimals = 0;
    
    uint public supply;
    address public founder;
    
    mapping(address => uint) public balances;
    
    mapping(address => mapping(address => uint)) allowed;
    
    //allowed[0x1111....][0x22222...] = 100;
    
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
    constructor(){
        supply = 200000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
function allowance(address tokenOwner, address spender) view public override returns(uint){
        return allowed[tokenOwner][spender];
    }
//approve allowance
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
    function approve(address spender, uint tokens) public override returns(bool){
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);
        
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
//transfer tokens from the  owner account to the account that calls the function
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
    function transferFrom(address from, address to, uint tokens) public virtual override returns(bool){
        require(allowed[from][to] >= tokens);
        require(balances[from] >= tokens);
        
        balances[from] -= tokens;
        balances[to] += tokens;
        
        
        allowed[from][to] -= tokens;
        
        return true;
    }
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
function totalSupply() public view override returns (uint){
        return supply;
    }
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
function balanceOf(address tokenOwner) public view override returns (uint balance){
         return balances[tokenOwner];
     }
    /// @notice precondition decimals >= 0
    /// @notice precondition supply >= 0
    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) forall (address extraVar1) allowed[extraVar0][extraVar1] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition tokens >= 0
    /// @notice precondition msg.sender == admin
    /// @notice postcondition forall (address newDeposit) deposit == newDeposit
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
    constructor(address payable _deposit){
        deposit = _deposit;
        admin = msg.sender;
        ieoState = State.beforeStart;
    }
//emergency stop
    function halt() public onlyAdmin{
        ieoState = State.halted;
    }
//restart 
    function unhalt() public onlyAdmin{
        ieoState = State.running;
    }
//only the admin can change the deposit address
    //in solidity version > 0.5.0 the deposit argument must be payable
    function changeDepositAddress(address payable newDeposit) public onlyAdmin{
        deposit = newDeposit;
    }
//returns ieo state
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
    receive() external payable{
        invest();
    }
function burn() public returns(bool){
        ieoState = getCurrentState();
        require(ieoState == State.afterEnd);
        balances[founder] = 0;
        return true;
    }
function transfer(address to, uint value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        return super.transfer(to, value);
    }
function transferFrom(address _from, address _to, uint _value) public override returns(bool){
        require(block.timestamp > coinTradeStart);
        return super.transferFrom(_from, _to, _value);
    }
function bug_unchk_send21() payable public{ payable(msg.sender).transfer(1 ether);}

}
