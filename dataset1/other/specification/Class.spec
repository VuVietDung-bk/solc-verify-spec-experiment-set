variables
{
    Student[] students;
}

rule create_student_adds_entry() {
    createStudent("alice", 10);
    assert students.length > 0;
}
