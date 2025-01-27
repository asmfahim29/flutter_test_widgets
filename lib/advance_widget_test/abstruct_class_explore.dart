void main() {
  // Abstract
  final car = Car();

  car.accelerate();

  car.deAccelerate();
}

abstract class Vehicle {
  int noOfWheels = 10;

  void accelerate();

  void deAccelerate();
}

class Car extends Vehicle {
  @override
  void accelerate() {
    print("car is accelerating to 60 mph");
  }

  @override
  void deAccelerate() {
    print("car is de accelerating to 20 mph");
  }
}

class Truck implements Vehicle {
  @override
  int noOfWheels = 20;

  @override
  void accelerate() {
    print("truck is accelerating to 60 mph $noOfWheels");
  }

  @override
  void deAccelerate() {
    print("truck is de accelerating to 20 mph");
  }
}
