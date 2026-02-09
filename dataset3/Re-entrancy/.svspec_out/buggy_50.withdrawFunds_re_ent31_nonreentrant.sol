/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.7.0;

contract digitalNotary
{
    
  address payable lastPlayer_re_ent2;
      uint jackpot_re_ent2;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
	  function buyTicket_re_ent2() public{
	    (bool sent,) = lastPlayer_re_ent2.call{value: jackpot_re_ent2}("");
                if (!sent)
                revert();
            lastPlayer_re_ent2 = payable(msg.sender);
      jackpot_re_ent2    = address(this).balance;
    }
  address payable private manager;
    
  mapping(address => uint) balances_re_ent17;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition _weiToWithdraw >= 0
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
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
    payable(msg.sender).transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  uint private HashListLength;
    
  mapping(address => uint) balances_re_ent31;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition _weiToWithdraw >= 0
    /// @notice precondition balances_re_ent31[msg.sender] >= _weiToWithdraw
    /// @notice postcondition balances_re_ent31[msg.sender] == __verifier_old_uint(balances_re_ent31[msg.sender]) - _weiToWithdraw
    /// @notice postcondition __verifier_old_uint(contract.balance) >= contract.balance && __verifier_old_uint(contract.balance) - contract.balance <= _weiToWithdraw
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
    (bool sent,) = payable(msg.sender).call{value: _weiToWithdraw}("");  //bug
    require(sent, "send failed");
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  bool not_called_re_ent13 = true;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,) = payable(msg.sender).call{value: 1 ether}("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    constructor()
    {

        manager = payable(msg.sender);
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
mapping(address => uint) userBalance_re_ent19;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
    
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition newfee >= 0
    function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition newfee >= 0
     function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
uint256 counter_re_ent7 =0;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	(bool success,) = payable(msg.sender).call{value: 10 ether}("");
            if( ! success ){
            revert();
        }
        counter_re_ent7 += 1;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
     function getmanager() external view returns(address)
    {
        return manager;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
mapping(address => uint) balances_re_ent8;
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function withdraw_balances_re_ent8 () public {
       (bool success,) = payable(msg.sender).call{value: balances_re_ent8[msg.sender ]}("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
    /// @notice precondition indx >= 0
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
    
    /// @notice precondition jackpot_re_ent2 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent17[extraVar0] >= 0
    /// @notice precondition hashfee >= 0
    /// @notice precondition changehashownerfee >= 0
    /// @notice precondition forall (address extraVar0) redeemableEther_re_ent25[extraVar0] >= 0
    /// @notice precondition HashListLength >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent31[extraVar0] >= 0
    /// @notice precondition forall (address extraVar0) userBalance_re_ent19[extraVar0] >= 0
    /// @notice precondition counter_re_ent7 >= 0
    /// @notice precondition forall (address extraVar0) balances_re_ent8[extraVar0] >= 0
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
    
    receive() external payable {}
}
