methods {
    function automatricula(string, string) external;
}

/// @title Enrollment adds exactly one student
rule automatricula_accepts_nonempty(env e, string a, string b) {
    uint256 beforeCount = currentContract.matriculas.length;

    automatricula(e, a, b);

    uint256 afterCount = currentContract.matriculas.length;
    assert afterCount == beforeCount + 1;
}
