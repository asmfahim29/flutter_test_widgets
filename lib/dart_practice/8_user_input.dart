import 'dart:io';

void main() {
  print("Enter your name : ");
  String? name = stdin.readLineSync();
  print("Hello $name");


  /// Type conversion from user input
  print ("Enter a number : ");

  var name2 = stdin.readLineSync();
  print(int.parse(name2 ?? '0') + 10);


}