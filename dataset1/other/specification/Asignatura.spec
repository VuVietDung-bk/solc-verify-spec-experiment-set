variables
{
    address profesor;
    string nombre;
    string curso;
}

rule get_curso_callable() {
    getCurso();
    assert true;
}
