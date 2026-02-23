// Spec for DosNumber contract - Denial of Service vulnerability
// Large loops in insertNnumbers can exceed gas limits

variables {
    uint numElements;
}

/**
 * Rule: insertNnumbers_increases_count
 * After insertion, numElements should increase by 'numbers' parameter.
 */
rule insertNnumbers_increases_count(uint value, uint numbers) {
    uint countBefore = numElements;
    
    insertNnumbers(value, numbers);
    
    assert numElements == countBefore + numbers;
}

/**
 * Rule: clear_requires_minimum_elements
 * Clear should only work when numElements > 1500.
 */
rule clear_requires_minimum_elements() {
    require numElements <= 1500;
    
    clear();
    
    // Should revert if numElements <= 1500
    assert false;
}

/**
 * Rule: getLengthArray_matches_numElements
 * getLengthArray should return numElements.
 */
rule getLengthArray_returns_numElements() {
    uint length = getLengthArray();
    
    assert length == numElements;
}
