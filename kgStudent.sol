pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract Student {
    
    struct student {
        string name;
        string mothersName;
        string fathersName;
        string citizenship;
        string birthPlace;
        uint dateOfBirth;
        
    }
    
    student[] private studentList;
    
    mapping (address => student) public students;
    
    function setStudent(string memory name, string memory mothersName, string memory fathersName, string memory citizenship, string memory birthPlace, uint dateOfBirth) public {
        address creator = msg.sender;
        
        student memory newStudent;
        newStudent.name = name;
        newStudent.mothersName = mothersName;
        newStudent.fathersName = fathersName;
        newStudent.citizenship = citizenship;
        newStudent.birthPlace = birthPlace;
        newStudent.dateOfBirth = dateOfBirth;
        students[creator] = newStudent;
        
        studentList.push(newStudent);
    }
    
    function getStudent() public view returns (string memory name, string memory mothersName, string memory fathersName, string memory citizenship, string memory birthPlace, uint dateOfBirth) {
        address creator = msg.sender;
        return (students[creator].name, students[creator].mothersName, students[creator].fathersName, students[creator].citizenship, students[creator].birthPlace, students[creator].dateOfBirth);
    }
    
    function getStudentList() public view returns (student [] memory){
        return studentList;
    }
}
