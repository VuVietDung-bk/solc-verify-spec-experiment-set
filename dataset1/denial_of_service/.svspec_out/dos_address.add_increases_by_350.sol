/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/dos_gas_limit/dos_address.sol
 * @author: -
 * @vulnerable_at_lines: 16,17,18
 */

pragma solidity >=0.7.0;

contract DosGas {

    address[] creditorAddresses;
    bool win = false;

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function emptyCreditors() public {
        // <yes> <report> DENIAL_OF_SERVICE
        if(creditorAddresses.length>1500) {
            creditorAddresses = new address[](0);
            win = true;
        }
    }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition creditorAddresses.length == 0
    /// @notice postcondition creditorAddresses.length == 350
    function addCreditors() public returns (bool) {
        for(uint i=0;i<350;i++) {
          creditorAddresses.push(msg.sender);
        }
        return true;
    }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function iWin() public view returns (bool) {
        return win;
    }

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function numberCreditors() public view returns (uint) {
        return creditorAddresses.length;
    }
}
