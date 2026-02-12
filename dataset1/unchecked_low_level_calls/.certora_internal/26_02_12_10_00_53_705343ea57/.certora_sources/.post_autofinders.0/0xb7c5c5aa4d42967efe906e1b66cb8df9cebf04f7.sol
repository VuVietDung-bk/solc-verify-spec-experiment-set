/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 25
 */

pragma solidity >=0.7.0;

/*
!!! THIS CONTRACT IS EXPLOITABLE AND FOR EDUCATIONAL PURPOSES ONLY !!!

This smart contract allows a user to (insecurely) store funds
in this smart contract and withdraw them at any later point in time
*/

contract keepMyEther {
    mapping(address => uint256) public balances;
    
    fallback() payable external {
        balances[msg.sender] += msg.value;
    }

    receive() payable external {
        
    }
    
    function withdraw() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        // <yes> <report> UNCHECKED_LL_CALLS
        msg.sender.call{value: balances[msg.sender]}("");
        balances[msg.sender] = 0;
    }
}