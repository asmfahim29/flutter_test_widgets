void main() {
  /// Mixin

//   final animal = Animal();

//   animal.fun();


  Animal2 animal = Cat();

  switch(animal){
    case Human(): print("Human called");

    case Dog(): print("Dog called");

    case Cat(): print("Cat called");
  }

}

mixin Jump {
  int jumping = 10;
}

mixin Sound {
  bool sound = true;
}

class Animal with Jump, Sound {
  void fun() {
    print("Animal can Jump : $jumping cm and can Sound $sound");
  }
}


sealed class Animal2 {}

class Human implements Animal2 {}

class Dog implements Animal2 {}

class Cat extends Animal2 {}



/// Other modifiers
base class Animal3 {}

final class Animal4 {}

interface class Animal5 {}

base class Human2 extends Animal3{}

final class Human3 extends Animal4 {}

abstract interface class Animal6{}

mixin class Animal7{}





