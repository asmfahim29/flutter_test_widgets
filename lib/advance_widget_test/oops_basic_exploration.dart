void main() {
  /// OOPS
  /// 1. Polymorphism, 2. Abstraction, 3. Inheritance, 4. Encapsulation

  /// Polymorphism
  Animal cat = Cat();

  cat.sound();

  cat = Dog();

  cat.sound();

  /// Abstraction
  Animal2 animal2 = Horse();
  animal2.sound();

  animal2 = Elephant();
  animal2.sound();

  /// Encapsulation Data hiding from everyone
}

//polymorphism

class Animal {
  void sound() {
    print("Animal making sound");
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print("Cat is making sound meow");
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog is making Barking");
  }
}

abstract class Animal2 {
  void sound() {
    print("Animal2 making sound");
  }
}

class Horse extends Animal2 {
  @override
  void sound() {
    print("Horse is making sound");
  }
}

class Elephant extends Animal2 {
  @override
  void sound() {
    print("Elephant is making sound");
  }
}

class Person {
  String _name = "Person Name";
  int age = 28;

  void getName() {
    print("$_name");
  }

  void getAge() {
    print("$age");
  }
}
