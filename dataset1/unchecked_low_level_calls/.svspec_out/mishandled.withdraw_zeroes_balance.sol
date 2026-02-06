/*
 * @source: https://github.com/seresistvanandras/EthBench/blob/master/Benchmark/Simple/mishandled.sol 
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;
contract SendBack {
    mapping (address => uint) userBalances;
    /// @notice precondition forall (address extraVar0) userBalances[extraVar0] >= 0
    /// @notice postcondition userBalances[msg.sender] == 0
    function withdrawBalance() public {  
		uint amountToWithdraw = userBalances[msg.sender];
		userBalances[msg.sender] = 0;
        // <yes> <report> UNCHECKED_LL_CALLS
		payable(msg.sender).transfer(amountToWithdraw);
	}
}
