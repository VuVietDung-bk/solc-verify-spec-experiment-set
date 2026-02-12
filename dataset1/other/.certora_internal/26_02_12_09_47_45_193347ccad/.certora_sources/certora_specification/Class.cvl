methods {
    function createStudent(string, uint256) external;
}

/// @title createStudent adds at least one entry
rule create_student_adds_entry(env e) {
    createStudent(e, "alice", 10);

    assert currentContract.students.length > 0;
}
