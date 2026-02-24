// CVL Spec for DosNumber contract - Denial of Service vulnerability
// Large loops in insertNnumbers can exceed gas limits

methods {
    function insertNnumbers(uint, uint) external;
    function clear() external;
    function clearDOS() external;
    function getLengthArray() external returns (uint) envfree;
    function getRealLengthArray() external returns (uint) envfree;
}

/**
 * Rule: insertNnumbers_increases_count
 * After insertion, getLengthArray should increase by 'numbers' parameter.
 */
rule insertNnumbers_increases_count(env e, uint value, uint numbers) {
    uint countBefore = getLengthArray();
    
    insertNnumbers(e, value, numbers);
    
    uint countAfter = getLengthArray();
    
    assert countAfter == countBefore + numbers;
}

/**
 * Rule: clear_requires_minimum_elements
 * Clear should only work when getLengthArray > 1500.
 */
rule clear_requires_minimum_elements(env e) {
    require getLengthArray() <= 1500;
    
    clear@withrevert(e);
    
    // Should revert if numElements <= 1500
    assert lastReverted;
}

/**
 * Rule: getLengthArray_consistent_with_getRealLengthArray
 * getLengthArray and getRealLengthArray should be consistent.
 */
rule getLengthArray_consistent() {
    uint length = getLengthArray();
    uint realLength = getRealLengthArray();
    
    assert length <= realLength;
}
