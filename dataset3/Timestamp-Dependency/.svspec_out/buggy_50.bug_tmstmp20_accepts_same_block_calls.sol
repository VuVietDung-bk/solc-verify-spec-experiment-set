/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address payable private manager;
    
  bool private contractactive;
    
  address winner_tmstmp19;
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition startTime >= 0
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  uint private hashfee;
    
  uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition contract.balance >= 0
    /// @notice postcondition true
  function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = block.timestamp;       //bug
        if(block.timestamp % 15 == 0) { // winner    //bug
            payable(msg.sender).transfer(address(this).balance);
        }
    }
  mapping(bytes32 => HashRegistration[]) HashList;
    
  uint private HashListLength;
    
  uint256 bugv_tmstmp3 = block.timestamp;
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  uint256 bugv_tmstmp4 = block.timestamp;
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    constructor()
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
uint256 bugv_tmstmp2 = block.timestamp;
    
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition newfee >= 0
    function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
    
    
    
    
    
    
    
    
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    /// @notice precondition newfee >= 0
     function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
     function getmanager() external view returns(address)
    {
        return manager;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
    
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
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
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
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
    /// @notice precondition HashListLength >= 0
    /// @notice precondition bugv_tmstmp3 >= 0
    /// @notice precondition bugv_tmstmp4 >= 0
    /// @notice precondition bugv_tmstmp2 >= 0
    /// @notice precondition bugv_tmstmp5 >= 0
    /// @notice precondition bugv_tmstmp1 >= 0
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
uint256 bugv_tmstmp5 = block.timestamp;
    
    fallback() external {
    }
uint256 bugv_tmstmp1 = block.timestamp;
}
