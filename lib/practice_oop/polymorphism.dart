void main () {
  Child child = Child();
  child.func();
  child.function(10);

  child.function(20);
}


// Method Overloading --> Dart doesn't support method overloading
class Parent {
  void func () {
    print("Parent function()");
  }

  // void func (int a) {
  //   print("Parent function(int a)");
  // }

  void function (int a) {
    print("Parent function(int a)");
  }
}
// Method Overriding
class Child extends Parent {
  @override
  void function (int a) {
    print("Child function(int) : a");
  }
}

