/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 29
 */

pragma solidity >=0.7.0;

contract MultiplicatorX3
{
    address public Owner = msg.sender;
   
    function withdraw()
    payable
    public
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        require(msg.sender == Owner);
        payable(Owner).transfer(address(this).balance);
    }
    
    function Command(address adr,bytes memory data)
    payable
    public
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, data) }
        require(msg.sender == Owner);
        // <yes> <report> UNCHECKED_LL_CALLS
        adr.call{value: msg.value}(data);
    }
    
    function multiplicate(address adr)
    public
    payable
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00026000, adr) }
        if(msg.value>=address(this).balance)
        {        
            payable(adr).transfer(address(this).balance+msg.value);
        }
    }
}