void main() {

  print(Constants.greetings);
  print(Constants.bye);

  print(Constants.giveMeSomeValue());

}


class Constants {
//   String greetings = "Hello, Welcome to the office";
//   String byr = "Bye!";

  Constants(){
    print("Constants constructor is called");
  }

  /// Static variables
  static String greetings = "Hello, Welcome to the office";
  static String bye = "Bye!";


  /// static Methods
  static int giveMeSomeValue () {
    return 10;
  }

}





