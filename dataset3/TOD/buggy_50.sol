/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
address payable private manager;
    
  address payable winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256(abi.encode(guess)) == keccak256(abi.encode('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
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
    
    constructor() {

        manager = msg.sender;
        
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
    
    
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
    
     function getmanager() external view returns(address)
    {
        return manager;
    }
    
    function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
    
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
    
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
bool claimed_TOD2 = false;
address payable owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        payable(msg.sender).transfer(reward_TOD2);
        claimed_TOD2 = true;
    }

}
