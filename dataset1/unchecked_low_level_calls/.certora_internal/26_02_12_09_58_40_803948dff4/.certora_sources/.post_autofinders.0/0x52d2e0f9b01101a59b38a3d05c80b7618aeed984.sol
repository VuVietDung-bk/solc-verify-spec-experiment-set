/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 27
 */

pragma solidity >=0.7.0;
abstract contract Token {
    function transfer(address _to, uint _value) public virtual returns (bool success);
    function balanceOf(address _owner) public virtual returns (uint balance);
}
contract EtherGet {
    address owner;
    constructor() {
        owner = msg.sender;
    }
    function withdrawTokens(address tokenContract) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, tokenContract) }
        Token tc = Token(tokenContract);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        tc.transfer(owner, tc.balanceOf(address(this)));
    }
    function withdrawEther() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        payable(owner).transfer(address(this).balance);
    }
    function getTokens(uint num, address addr) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026001, addr) }
        for(uint i = 0; i < num; i++){
            // <yes> <report> UNCHECKED_LL_CALLS
            addr.call{value: 0 wei}("");
        }
    }
}