void main() {
//   Cookie cookie = Cookie();
//   final cookie = CookieWithConstructor("Triangle", 25.36, 68);

//   final cookie = CookieWithConstructor(shape: "Rectangle", size: 25.36, quantity: 58);
//   cookie.baking();
//   print(cookie.isCookingClosed());

//   cookie.shape = "Rectangle";
//   print(cookie.shape);

  final anotherCookie = Cookie();

  anotherCookie.privateVariable = "Top Center Circular";
  anotherCookie.setHeight = 15;
  anotherCookie.setWidth = 6;

  print(anotherCookie.calculateSize());
}

class Cookie {
  /// variables
  String shape = "Circle";
  int quantity = 20;
  double size = 25.36; //cm

  // private variables (private variables are private on a file)
  String _privateVariable = "PrivateVariable";
  int _height = 25;
  int _width = 5;

  // Getters (read only value can not modify it)
  String get privateVariable => _privateVariable;

  int get height => _height;

  int get width => _width;

  // Setters(no return type just assign the variable)

  set privateVariable(String pV) {
    _privateVariable = pV;
  }

  set setHeight(int h) {
    _height = h;
  }

  set setWidth(int w) {
    _width = w;
  }

  // Static functions
  int calculateSize() {
    return height * width;
  }

  // Static variables

  /// functions
  void baking() {
    print("Baking Started");
  }

  bool isCookingClosed() {
    return false;
  }
}

/// class with constructor
class CookieWithConstructor {
  final String shape;
  final double size;
  final int quantity;

  /// normal type constructor
//   CookieWithConstructor(this.shape, this.size, this.quantity){

//     print("inside constructor $shape");
//     print("inside constructor $size");
//     print("inside constructor $quantity");

//     baking();
//   }

//   /// null constructor
//   CookieWithConstructor();

  /// parameterized constructor
  CookieWithConstructor(
      {required this.shape, required this.size, required this.quantity}) {
    baking();
  }

  /// functions
  void baking() {
    print(
        "Baking Started with $shape Shape, Size $size cm, Quantity $quantity ");
  }

  bool isCookingClosed() {
    return false;
  }
}
