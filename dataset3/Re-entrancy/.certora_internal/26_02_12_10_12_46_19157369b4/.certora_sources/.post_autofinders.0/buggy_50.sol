/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  address payable private manager;
    
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046000, _weiToWithdraw) }
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
    require(success);  //bug
        balances_re_ent17[msg.sender] -= _weiToWithdraw;
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
    
  mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,transferValue_re_ent25)}
    payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint private HashListLength;
    
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076000, _weiToWithdraw) }
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010004,0)}  //bug
    require(sent, "send failed");
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090004, 0) }
        require(not_called_re_ent13);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    constructor()
    {

        manager = payable(msg.sender);
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,) = payable(msg.sender).call{value: userBalance_re_ent19[msg.sender]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010006,0)}
        if( ! success ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
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
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
        require(counter_re_ent7<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
            if( ! success ){
            revert();
        }
        counter_re_ent7 += 1;
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
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
       
        return address(this).balance;
    }
    
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,cb)}
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
       (bool success,) = payable(msg.sender).call{value: balances_re_ent8[msg.sender ]}("");assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
    
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, hash) }
        return HashList[hash].length;
    }
    
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
    
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,owncount)}
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
    
    function registerHash(bytes32 hash) external payable
    {
      
        require(contractactive == true);
        require(getHashOwnersCount(hash) == 0);
        require(msg.value == hashfee);
        
        HashRegistration memory thisregistration;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
        thisregistration.owner = msg.sender;address certora_local14 = thisregistration.owner;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,certora_local14)}
        thisregistration.registrationtime = block.timestamp;uint256 certora_local15 = thisregistration.registrationtime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,certora_local15)}
        
        HashList[hash].push(thisregistration);
        
        HashListLength++;
        
        emit RegisterHashEvent(thisregistration.owner, hash, thisregistration.registrationtime);
        
    }
    
    function changeHashOwnership(bytes32 hash, address newowner) external payable
    {
        
        require(contractactive == true);
        uint owncount = getHashOwnersCount(hash);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,owncount)}
        require(owncount > 0);
        require(msg.sender == HashList[hash][owncount - 1].owner); 
        require(msg.value == changehashownerfee);
        
        HashRegistration memory thisregistration;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000d,0)}
        thisregistration.owner = newowner;address certora_local16 = thisregistration.owner;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,certora_local16)}
        thisregistration.registrationtime = block.timestamp;uint256 certora_local17 = thisregistration.registrationtime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,certora_local17)}
        
        HashList[hash].push(thisregistration);
        
        emit ChangeHashOwnershipEvent(msg.sender, thisregistration.owner, hash, thisregistration.registrationtime);
    }
    
    receive() external payable {}
}
