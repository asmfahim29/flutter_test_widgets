void main() {
  // Implements(@override)

  final car = Car();
  final truck = Truck();

  print(car.noOfWheels);
  print(truck.noOfWheels);

  final workWithBothClass = WorkWithBothClass();

  workWithBothClass.accelerate();
}

class Vehicle {
  bool isEngineIsWorking = false;
  bool isLightOn = true;
  int noOfWheels = 10;

  void accelerate() {
    print("Accelerating");
  }
}

class Car extends Vehicle {
  int noOfWheels = 4;

  void printWheels() {
    print(noOfWheels);
  }

  /// for inherite a class super gives a reference of that parent class to access the properties, In terms of Implements it can not have any super

  @override
  void accelerate() {
    super.accelerate();
  }
}

class Truck extends Vehicle {
  int noOfWheels = 8;

  void printWheels() {
    print(noOfWheels);
  }
}

class Bike implements Vehicle {
  @override
  bool isEngineIsWorking = true;

  @override
  bool isLightOn = true;

  @override
  int noOfWheels = 2;

  @override
  void accelerate() {
    print("Accelerating bike");
  }
}

class ExtendClass {
  bool isEngineIsWorking = false;
  bool isLightOn = true;
  int noOfWheels = 10;
}

class ImplementsClass {
  void accelerate() {
    print("Accelerating");
  }
}

class WorkWithBothClass extends ExtendClass implements ImplementsClass {
  @override
  void accelerate() {
    print("===extend ExtendClass and implements ImplementClass===");

    print(isEngineIsWorking);

    print(isLightOn);
  }
}
