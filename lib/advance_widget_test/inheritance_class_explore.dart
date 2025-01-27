void main() {
  // Inheritance
  final car1 = Car();

  print(car1.speed);
  print(car1.isEngineIsWorking);

  final car = Car();

  print(car.isLightOn);
  print(car.noOfWheels);
  print(car.accelerate());

  car.printSpeed();

  // OOPS
}

class Vehicle2 {
  String alermWarning = "Please slowdown speed";
  int speed = 15;

  void accelerate() {
    speed += 30;
  }
}

class Vehicle extends Vehicle2 {
  bool isEngineIsWorking = false;
  bool isLightOn = true;

  @override
  int accelerate() {
    return speed += 10;
  }
}

class Car extends Vehicle {
  int noOfWheels = 4;

  void printSpeed() {
    print(speed);
  }
}
