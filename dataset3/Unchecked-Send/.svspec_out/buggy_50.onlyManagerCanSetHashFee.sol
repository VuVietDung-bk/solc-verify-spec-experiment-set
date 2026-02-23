/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
address payable private manager;
bool private contractactive;
uint private hashfee;
uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
mapping(bytes32 => HashRegistration[]) HashList;
uint private HashListLength;
event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    constructor() public
    {

        manager = payable(msg.sender);
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
modifier onlyManager()
    {
        require(msg.sender == manager);
        _;
    }
    
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition newfee >= 0
    /// @notice precondition msg.sender != manager
    /// @notice postcondition false
function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition newfee >= 0
function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getmanager() external view returns(address)
    {
        return manager;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
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
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
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
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
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
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
fallback() external
    {
    	
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
function bug_unchk_send28() payable public{
      payable(msg.sender).transfer(1 ether);}

}
