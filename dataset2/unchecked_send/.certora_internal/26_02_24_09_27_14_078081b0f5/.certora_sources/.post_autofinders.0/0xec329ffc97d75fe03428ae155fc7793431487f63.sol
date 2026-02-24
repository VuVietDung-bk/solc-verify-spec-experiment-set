/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 30
 */

pragma solidity >=0.7.0; /* originally >=0.4.11 */

contract Owned {
    constructor() {
        owner = msg.sender;
    }

    address public owner;

    // This contract only defines a modifier and a few useful functions
    // The function body is inserted where the special symbol "_" in the
    // definition of a modifier appears.
    modifier onlyOwner { if (msg.sender == owner) _; }

    function changeOwner(address _newOwner) public logInternal5(_newOwner)onlyOwner {
        owner = _newOwner;
    }modifier logInternal5(address _newOwner) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056000, _newOwner) } _; }

    // This is a general safty function that allows the owner to do a lot
    //  of things in the unlikely event that something goes wrong
    // _dst is the contract being called making this like a 1/1 multisig
    function execute(address _dst, uint _value, bytes memory _data) public logInternal7(_data)onlyOwner {
        // <yes> <report> UNCHECKED_LL_CALLS
        _dst.call{value: _value}(_data);
    }modifier logInternal7(bytes memory _data) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00076002, _data) } _; }
}
// to get the needed token functions in the abstract contract
abstract contract Token {
    function transfer(address, uint) public virtual returns(bool);
    function balanceOf(address) public view virtual returns (uint);
}

contract TokenSender is Owned {
    Token public token; // the token we are working with
    uint public totalToDistribute;

    uint public next;


    struct Transfer {
        address addr;
        uint amount;
    }

    Transfer[] public transfers;

    constructor(address _token) {
        token = Token(_token);
    }

    // this is a used to save gas
    uint constant D160 = 0x0010000000000000000000000000000000000000000;

    // This is the function that makes the list of transfers and various
    //  checks around that list, it is a little tricky, the data input is
    //  structured with the `amount` and the (receiving) `addr` combined as one
    //  long number and then this number is deconstructed in this function to
    //  save gas and reduce the number of `0`'s that are needed to be stored
    //   on the blockchain
    function fill(uint[] memory data) public logInternal4(data)onlyOwner {

        // If the send has started then we just throw
        if (next>0) revert();

        uint acc;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,acc)}
        uint offset = transfers.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,offset)}
        for (uint j = 0; j < data.length; j++) {
            transfers.push();
        }
        for (uint i = 0; i < data.length; i++ ) {
            address addr = address(uint160(data[i] & (D160-1) ));assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,addr)}
            uint amount = data[i] / D160;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,amount)}

            transfers[offset + i].addr = addr;
            transfers[offset + i].amount = amount;
            acc += amount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,acc)}
        }
        totalToDistribute += acc;
    }modifier logInternal4(uint256[] memory data) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00046000, data) } _; }
    // This function actually makes the sends and tracks the amount of gas used
    //  if it takes more gas than was sent with the transaction then this
    //  function will need to be called a few times until
    function run() public logInternal6()onlyOwner {
        if (transfers.length == 0) return;

        // Keep next in the stack var mNext to save gas
        uint mNext = next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,mNext)}

        // Set the contract as finalized to avoid reentrance
        next = transfers.length;

        if ((mNext == 0 ) && ( token.balanceOf(address(this)) != totalToDistribute)) revert();

        while ((mNext<transfers.length) && ( gas() > 150000 )) {
            uint amount = transfers[mNext].amount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,amount)}
            address addr = transfers[mNext].addr;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,addr)}
            if (amount > 0) {
                if (!token.transfer(addr, transfers[mNext].amount)) revert();
            }
            mNext ++;
        }

        // Set the next to the actual state.
        next = mNext;
    }modifier logInternal6() { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) } _; }


    ///////////////////////
    // Helper functions
    ///////////////////////

    function hasTerminated() public view returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
        if (transfers.length == 0) return false;
        if (next < transfers.length) return false;
        return true;
    }

    function nTransfers() public view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
        return transfers.length;
    }

    function gas() internal view returns (uint _gas) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
        assembly {
            _gas:= gas()
        }
    }

}
