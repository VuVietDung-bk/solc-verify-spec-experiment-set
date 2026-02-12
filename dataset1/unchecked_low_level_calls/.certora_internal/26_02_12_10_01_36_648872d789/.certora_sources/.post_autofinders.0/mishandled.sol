/*
 * @source: https://github.com/seresistvanandras/EthBench/blob/master/Benchmark/Simple/mishandled.sol 
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;
contract SendBack {
    mapping (address => uint) userBalances;
    function withdrawBalance() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }  
		uint amountToWithdraw = userBalances[msg.sender];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,amountToWithdraw)}
		userBalances[msg.sender] = 0;
        // <yes> <report> UNCHECKED_LL_CALLS
		payable(msg.sender).transfer(amountToWithdraw);
	}
}