/*
 * @source: https://github.com/sigp/solidity-security-blog#storage-example
 * @vulnerable_at_lines: 21
 */
// A Locked Name Registrar

pragma solidity >=0.7.0;
contract NameRegistrar {

    bool public unlocked = false;  // registrar locked, no name updates

    struct NameRecord { // map hashes to addresses
        bytes32 name;
        address mappedAddress;
    }

    mapping(address => NameRecord) public registeredNameRecord; // records who registered names
    mapping(bytes32 => address) public resolve; // resolves hashes to addresses

    function register(bytes32 _name, address _mappedAddress) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, _mappedAddress) }
        // set up the new NameRecord
        // <yes> <report> OTHER - uninitialized storage
        NameRecord memory newRecord;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010001,0)}
        newRecord.name = _name;bytes32 certora_local2 = newRecord.name;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,certora_local2)}
        newRecord.mappedAddress = _mappedAddress;address certora_local3 = newRecord.mappedAddress;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,certora_local3)}

        resolve[_name] = _mappedAddress;
        registeredNameRecord[msg.sender] = newRecord;

        require(unlocked); // only allow registrations if contract is unlocked
    }
}
