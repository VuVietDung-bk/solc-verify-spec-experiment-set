variables
{
    mapping(uint => address) matriculas;
}

rule automatricula_accepts_nonempty(string a, string b) {
    uint beforeCount = matriculas.length;
    automatricula(a, b);
    uint afterCount = matriculas.length;

    // Non-empty enrollment should add exactly one student.
    assert afterCount == beforeCount + 1;
}
