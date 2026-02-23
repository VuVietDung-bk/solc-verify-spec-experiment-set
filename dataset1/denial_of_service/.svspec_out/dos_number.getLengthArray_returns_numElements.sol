/*
 * @source: https://github.com/SmartContractSecurity/SWC-registry/blob/master/test_cases/dos_gas_limit/dos_number.sol
 * @author: -
 * @vulnerable_at_lines: 18,19,20,21,22
 */

pragma solidity >=0.7.0;

contract DosNumber {

    uint numElements = 0;
    uint[] array;

    /// @notice precondition numElements >= 0
    /// @notice precondition property(array) (extraIndex0) array[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition value >= 0
    /// @notice precondition numbers >= 0
    function insertNnumbers(uint value,uint numbers) public {

        // Gas DOS if number > 382 more or less, it depends on actual gas limit
        // <yes> <report> DENIAL_OF_SERVICE
        for(uint i=0;i<numbers;i++) {
            if(numElements == array.length) {
                array.push(0);
            }
            array[numElements++] = value;
        }
    }

    /// @notice precondition numElements >= 0
    /// @notice precondition property(array) (extraIndex0) array[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function clear() public {
        require(numElements>1500);
        numElements = 0;
    }

    // Gas DOS clear
    /// @notice precondition numElements >= 0
    /// @notice precondition property(array) (extraIndex0) array[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function clearDOS() public {

        // number depends on actual gas limit
        require(numElements>1500);
        array = new uint[](0);
        numElements = 0;
    }

    /// @notice precondition numElements >= 0
    /// @notice precondition property(array) (extraIndex0) array[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice postcondition length == numElements
    function getLengthArray() public view returns(uint length) {
        return numElements;
    }

    /// @notice precondition numElements >= 0
    /// @notice precondition property(array) (extraIndex0) array[extraIndex0] >= 0
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function getRealLengthArray() public view returns(uint) {
        return array.length;
    }
}
