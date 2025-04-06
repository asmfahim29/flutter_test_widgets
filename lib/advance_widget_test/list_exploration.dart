void main() {

  List<Student> students = [
    Student("FAHIM", 50),
    Student("JISHAN", 60),
    Student("SHAWON", 90),
    Student("IMRAN", 70),
  ];


//   print(students);

//   students.add(Student("ARNOB"));

//   print(students);

//   students.insert(4, Student("NEW KID"));

//   print(students);

//   students.remove(students[0]);

//   print(students);

//   students.add(Student("ARNOB"));

//   print(students);

  print(students);

  List<Student> filteredStudents = [];

//   for (int i = 0 ; i < students.length ; i++){
//     if(students[i].mark >= 60){
//       filteredStudents.add(students[i]);

//     }
//   }


//   for(Student student in students){
//     if(student.mark >= 60){
//       filteredStudents.add(student);

//     }
//   }


  final filteredStudents2 = students.where((student) => student.mark >= 60);

  print(filteredStudents2.toList());

}


class Student {
  final String name;
  final int mark;
  Student (this.name, this.mark);


  @override
  String toString() => 'Student : $name';
}
