/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 33
 */

pragma solidity >=0.7.0;


contract SimpleWallet {
    address public owner = msg.sender;
    uint public depositsCount;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    receive() external payable {
        depositsCount++;
    }
    
    function withdrawAll() public logInternal2()onlyOwner {
        withdraw(address(this).balance);
    }modifier logInternal2() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) } _; }
    
    function withdraw(uint _value) public logInternal1(_value)onlyOwner {
        payable(msg.sender).transfer(_value);
    }modifier logInternal1(uint256 _value) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, _value) } _; }
    
    function sendMoney(address _target, uint _value) public logInternal0(_value)onlyOwner {
        // <yes> <report> UNCHECKED_LL_CALLS
        _target.call{value: _value}("");
    }modifier logInternal0(uint256 _value) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, _value) } _; }
}