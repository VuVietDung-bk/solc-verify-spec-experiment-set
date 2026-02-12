pragma solidity >=0.7.0;

contract Class {

    struct Student {
        string name;
        uint8 age;
    }

    Student[] public students;

    function createStudent(string memory _name, uint8 _age) public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006001, _age) }
        students.push(Student(_name, _age));
    }
  
    function amountOfStudents() public view returns(uint count) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        return students.length;
    }

}
