/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
	  function buyTicket_re_ent2() public{
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  address payable private manager;
    
  mapping(address => uint) balances_re_ent17;
function withdrawFunds_re_ent17 (uint256 _weiToWithdraw) public {
        require(balances_re_ent17[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool success,) = payable(msg.sender).call{value: _weiToWithdraw}("");
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
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
    payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint private HashListLength;
    
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");  //bug
    require(sent, "send failed");
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");
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
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,) = payable(msg.sender).call{value: userBalance_re_ent19[msg.sender]}("");
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
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");
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
    {
       
        return address(this).balance;
    }
    
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       (bool success,) = payable(msg.sender).call{value: balances_re_ent8[msg.sender ]}("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
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
    
    receive() external payable {}
}
