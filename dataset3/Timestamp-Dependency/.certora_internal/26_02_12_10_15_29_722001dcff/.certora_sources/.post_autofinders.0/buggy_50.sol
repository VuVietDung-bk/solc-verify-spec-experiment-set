/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
  function bug_tmstmp9() view public returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
    return block.timestamp >= 1546300800;
  }
  address payable private manager;
    
  bool private contractactive;
    
  address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, startTime) }
	uint _vtime = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,_vtime)}
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  uint private hashfee;
    
  uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
    
  function bug_tmstmp20 () public payable {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
	uint pastBlockTime_tmstmp20;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,pastBlockTime_tmstmp20)} // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(block.timestamp != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,pastBlockTime_tmstmp20)}       //bug
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
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
       
        return address(this).balance;
    }
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,cb)}
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, hash) }
        return HashList[hash].length;
    }
    
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,owncount)}
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
    
    function registerHash(bytes32 hash) external payable
    {
      
        require(contractactive == true);
        require(getHashOwnersCount(hash) == 0);
        require(msg.value == hashfee);
        
        HashRegistration memory thisregistration;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        thisregistration.owner = msg.sender;address certora_local9 = thisregistration.owner;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,certora_local9)}
        thisregistration.registrationtime = block.timestamp;uint256 certora_local10 = thisregistration.registrationtime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,certora_local10)}
        
        HashList[hash].push(thisregistration);
        
        HashListLength++;
        
        emit RegisterHashEvent(thisregistration.owner, hash, thisregistration.registrationtime);
        
    }
    function changeHashOwnership(bytes32 hash, address newowner) external payable
    {
        
        require(contractactive == true);
        uint owncount = getHashOwnersCount(hash);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,owncount)}
        require(owncount > 0);
        require(msg.sender == HashList[hash][owncount - 1].owner); 
        require(msg.value == changehashownerfee);
        
        HashRegistration memory thisregistration;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
        thisregistration.owner = newowner;address certora_local11 = thisregistration.owner;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,certora_local11)}
        thisregistration.registrationtime = block.timestamp;uint256 certora_local12 = thisregistration.registrationtime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,certora_local12)}
        
        HashList[hash].push(thisregistration);
        
        emit ChangeHashOwnershipEvent(msg.sender, thisregistration.owner, hash, thisregistration.registrationtime);
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    fallback() external {
    }
uint256 bugv_tmstmp1 = block.timestamp;
}
