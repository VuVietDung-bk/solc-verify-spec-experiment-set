/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 52
 */

pragma solidity >=0.7.0;

contract PrivateDeposit
{
    mapping (address => uint) public balances;
        
    uint public MinDeposit = 1 ether;
    address public owner;
    
    Log TransferLog;
    
    modifier onlyOwner() {
        require(tx.origin == owner);
        _;
    }    
    
    constructor()
    {
        owner = msg.sender;
        TransferLog = new Log();
    }
    
    
    
    function setLog(address _lib) public onlyOwner
    {
        TransferLog = Log(_lib);
    }    
    
    function Deposit()
    public
    payable
    {
        if(msg.value >= MinDeposit)
        {
            balances[msg.sender]+=msg.value;
            TransferLog.AddMessage(msg.sender,msg.value,"Deposit");
        }
    }
    
    function CashOut(uint _am) public
    {
        if(_am<=balances[msg.sender])
        {            
            // <yes> <report> REENTRANCY
            (bool success, ) = msg.sender.call{value: _am}("");
            if(success)
            {
                balances[msg.sender]-=_am;
                TransferLog.AddMessage(msg.sender,_am,"CashOut");
            }
        }
    }
    
    receive() external payable {}    
    
}

contract Log 
{
   
    struct Message
    {
        address Sender;
        string  Data;
        uint Val;
        uint  Time;
    }
    
    Message[] public History;
    
    Message LastMsg;
    
    function AddMessage(address _adr,uint _val,string memory _data)
    public
    {
        LastMsg.Sender = _adr;
        LastMsg.Time = block.timestamp;
        LastMsg.Val = _val;
        LastMsg.Data = _data;
        History.push(LastMsg);
    }
}