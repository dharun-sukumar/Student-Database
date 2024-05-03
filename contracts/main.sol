// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract StudentDetails {
    struct Student {
        string name;
        uint rollNo; // Added roll number
        uint age;
        string department;
    }

    mapping(uint => Student) public students;
    uint public studentsCount;

    // Add a mapping to store roll number to student ID mapping
    mapping(uint => uint) public rollToId;

    function addStudent(string memory _name, uint _rollNo, uint _age, string memory _department) public {
        studentsCount++;
        students[studentsCount] = Student(_name, _rollNo, _age, _department);
        // Map roll number to student ID
        rollToId[_rollNo] = studentsCount;
    }

    function getStudentByRollNo(uint _rollNo) public view returns(string memory, uint, string memory) {
        require(rollToId[_rollNo] != 0, "Student with this roll number does not exist");
        uint studentId = rollToId[_rollNo];
        Student memory student = students[studentId];
        return (student.name, student.age, student.department);
    }
}
