void main() {
  //namedArguments(name: "Fahim", greetings: "Welcome");
  //positionalArguments(28);

  //namedWithPositionalArguments(28, name: "Fahim", greetings: "Welcome");

//   final (age, name) = printRecords();

//   print(age);
//   print(name);

//   final stuffType2 = printRecordsType2();

//   print(stuffType2.age);
//   print(stuffType2.name);

  final functionReturn = returnFunction();

  functionReturn();
  () {
    print("Function returning");
  }();
}

void positionalArguments(int age) {
  print(age);
}

void namedArguments(
    {required String name, int? age, required String greetings}) {
  print(name);
  print(age);
  print(greetings);
}

void namedWithPositionalArguments(int age,
    {required String name, required String greetings}) {
  print(name);
  print(age);
  print(greetings);
}

/// record
(int, String) printRecords() {
  return (12, "FAHIM");
}

({int age, String name}) printRecordsType2() {
  return (age: 12, name: "FAHIM");
}

// return a function from a function
Function returnFunction() {
  return () {
    print("Yahoo");
  };
}

/// Function that donot have aby name but behave like a function (bloc of code that can be executed) are anonymous functions.

// Ex: (){
//   print ('HEY');
// }

// will use a lot in flutter
