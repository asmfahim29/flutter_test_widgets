import 'dart:math';

void main() {
  /*Vehicle car = Car();
  car.startEngine();
  car.accelerate();
  car.brake();*/

  Shape cir = Circle(5.0);
  Shape rect = Rectangle(10, 15);

  print(cir.calculateArea());
  print(rect.calculateArea());

}

abstract class Vehicle {
  void accelerate();

  void brake();

  void startEngine() {
    print("Start engine");
  }
}

class Car extends Vehicle {
  @override
  void accelerate() {
    print("Car pressing gas padel");
  }

  @override
  void brake() {
    print("Car applying breaks");
  }

}


abstract class Shape {

  double calculateArea();

}

class Circle extends Shape {

  late double _r;

  Circle(double r){
    _r = r;
  }

  @override
  double calculateArea() {
    return pi * _r * _r;
  }
}

class Rectangle extends Shape {
  late double _length;
  late double _width;

  Rectangle(double length, double width) {
    _length = length;
    _width = width;
  }

  @override
  double calculateArea() {
    return _length * _width;
  }

}
