/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/dos_gas_limit/dos_simple.sol
 * @author: -
 * @vulnerable_at_lines: 17,18
 */


pragma solidity >=0.7.0;

contract DosOneFunc {

    address[] listAddresses;

    /// @notice precondition listAddresses.length < 1500
    /// @notice postcondition listAddresses.length > __verifier_old_uint(__verifier_old_address(listAddresses).length)
    function ifillArray() public returns (bool){
        if(listAddresses.length<1500) {
            // <yes> <report> DENIAL_OF_SERVICE
            for(uint i=0;i<350;i++) {
                listAddresses.push(msg.sender);
            }
            return true;

        } else {
            listAddresses = new address[](0);
            return false;
        }
    }
}
