/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
  function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
  address payable private manager;
    
  bool public payedOut_unchk9 = false;

    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
    payable(msg.sender).send(address(this).balance);
    }
  bool private contractactive;
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
  function callnotchecked_unchk25(address payable callee) public {
        callee.call{value: 1 ether}("");
  }
  uint private hashfee;
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
  function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
  function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
  mapping(bytes32 => HashRegistration[]) HashList;
    
  bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint private HashListLength;
    
  bool public payedOut_unchk45 = false;

    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
    payable(msg.sender).send(address(this).balance);
    }
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
  function callnotchecked_unchk13(address callee) public {
        payable(callee).call{value: 1 ether}("");
  }
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    constructor()
    {

        manager = payable(msg.sender);
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition payedOut_unchk32 == false
    /// @notice postcondition payedOut_unchk32
function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    
    modifier onlyManager()
    {
        require(msg.sender == manager);
        _;
    }
    
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition newfee >= 0
    function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition roundIndex >= 0
    /// @notice precondition subpotIndex >= 0
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition newfee >= 0
     function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
     function getmanager() external view returns(address)
    {
        return manager;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
function my_func_uncheck36(address payable dst) public payable{
    dst.call{value: msg.value}("");
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition indx >= 0
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function registerHash(bytes32 hash) external payable
    {
      
        require(contractactive == true);
        require(getHashOwnersCount(hash) == 0);
        require(msg.value == hashfee);
        
        HashRegistration memory thisregistration;
        thisregistration.owner = msg.sender;
        thisregistration.registrationtime = block.timestamp;
        
        HashList[hash].push(thisregistration);
        
        HashListLength++;
        
        emit RegisterHashEvent(thisregistration.owner, hash, thisregistration.registrationtime);
        
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition winAmount_unchk20 >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition winAmount_unchk32 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    function changeHashOwnership(bytes32 hash, address newowner) external payable
    {
        
        require(contractactive == true);
        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(msg.sender == HashList[hash][owncount - 1].owner); 
        require(msg.value == changehashownerfee);
        
        HashRegistration memory thisregistration;
        thisregistration.owner = newowner;
        thisregistration.registrationtime = block.timestamp;
        
        HashList[hash].push(thisregistration);
        
        emit ChangeHashOwnershipEvent(msg.sender, thisregistration.owner, hash, thisregistration.registrationtime);
    }
    fallback() external {
    }
}
