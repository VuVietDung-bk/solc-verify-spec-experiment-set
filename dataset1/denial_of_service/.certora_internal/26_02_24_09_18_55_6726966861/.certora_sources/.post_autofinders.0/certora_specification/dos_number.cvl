// CVL Spec for DosNumber contract - Denial of Service vulnerability
// Large loops in insertNnumbers can exceed gas limits

methods {
    function insertNnumbers(uint, uint) external;
    function clear() external;
    function clearDOS() external;
    function getLengthArray() external returns (uint) envfree;
    function getRealLengthArray() external returns (uint) envfree;
    function numElements() external returns (uint) envfree;
}

/**
 * Rule: insertNnumbers_increases_count
 * After insertion, numElements should increase by 'numbers' parameter.
 */
rule insertNnumbers_increases_count(env e, uint value, uint numbers) {
    uint countBefore = numElements();
    
    insertNnumbers(e, value, numbers);
    
    uint countAfter = numElements();
    
    assert countAfter == countBefore + numbers;
}

/**
 * Rule: clear_requires_minimum_elements
 * Clear should only work when numElements > 1500.
 */
rule clear_requires_minimum_elements(env e) {
    require numElements() <= 1500;
    
    clear@withrevert(e);
    
    // Should revert if numElements <= 1500
    assert lastReverted;
}

/**
 * Rule: getLengthArray_matches_numElements
 * getLengthArray should return numElements.
 */
rule getLengthArray_returns_numElements() {
    uint length = getLengthArray();
    uint count = numElements();
    
    assert length == count;
}
