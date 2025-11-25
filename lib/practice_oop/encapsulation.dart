void main() {
  Employee emp1 = Employee();
  emp1.setName("John");
  emp1.setAge(30);
  emp1.setSalary(5000);

  print("Name: ${emp1.getName()}\nAge: ${emp1.getAge()}\nSalary: ${emp1.getSalary()}\n\n\n");

  Employee emp2 = Employee();
  emp2.setName("Mike");
  emp2.setAge(35);
  emp2.setSalary(10000);

  print("Name: ${emp2.getName()}\nAge: ${emp2.getAge()}\nSalary: ${emp2.getSalary()}\n\n\n");


  Programmer engineer1 = Programmer();
  engineer1.setName("Jane");
  engineer1.setAge(28);
  engineer1.setSalary(8000);
  engineer1.setLanguage("Java");

  print("Name: ${engineer1.getName()}\nAge: ${engineer1.getAge()}\nSalary: ${engineer1.getSalary()}\nLanguage: ${engineer1.getLanguage()}\n\n\n");

  Programmer engineer2 = Programmer();
  engineer2.setName("Mike");
  engineer2.setAge(32);
  engineer2.setSalary(9000);
  engineer2.setLanguage("Python");

  print("Name: ${engineer2.getName()}\nAge: ${engineer2.getAge()}\nSalary: ${engineer2.getSalary()}\nLanguage: ${engineer2.getLanguage()}\n\n\n");

}

class Employee {
  late String _name;
  late int _age;
  late double _salary;

  void setName(String name) {
    _name = name;
  }

  String getName () {
    return _name;
  }

  void setAge(int age) {
    _age = age;
  }

  int getAge() {
    return _age;
  }

  void setSalary(double salary) {
    _salary = salary;
  }

  double getSalary() {
    return _salary;
  }

}

class Programmer {
  late String _name;
  late int _age;
  late double _salary;
  late String _language;
  
  void setName(String name) {
    _name = name;
  }
  
  String getName() {
    return _name;
  }
  
  void setAge(int age) {
    _age = age;
  }
  
  int getAge() {
    return _age;
  }
  
  void setSalary(double salary) {
    _salary = salary;
  }
  
  double getSalary() {
    return _salary;
  }
  
  void setLanguage(String language) {
    _language = language;
  }
  
  String getLanguage() {
    return _language;
  }
  
}