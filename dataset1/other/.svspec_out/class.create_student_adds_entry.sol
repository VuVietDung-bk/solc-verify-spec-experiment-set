pragma solidity >=0.7.0;

contract Class {

    struct Student {
        string name;
        uint8 age;
    }

    Student[] public students;

    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    /// @notice precondition _age >= 0
    /// @notice postcondition students.length > 0
    function createStudent(string memory _name, uint8 _age) public {
        students.push(Student(_name, _age));
    }
  
    /// @notice precondition block.timestamp >= 0
    /// @notice precondition block.number >= 0
    function amountOfStudents() public view returns(uint count) {
        return students.length;
    }

}
