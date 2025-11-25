void main () {
  Dog puppy = Dog();
  puppy.eat();
  puppy.sleep();

  puppy.bark();

  Car car = Car();

  CarHI carHI = CarHI();
  BikeHI bikeHI = BikeHI();

  AmphibiousVehicle  amphibiousVehicle = AmphibiousVehicle();
  amphibiousVehicle.amphibiousInfo();
}

// Single Inheritance
class Animal {
  void eat() {
    print("Eating");
  }

  void sleep() {
    print("Sleeping");
  }
}

class Dog extends Animal {
  void bark() {
    print("Barking");
  }
}


// Multilevel Inheritance
class Vehicle {
  void vehicle() {
    print("This is a Vehicle");
  }
}

class FourWheeler extends Vehicle {
  void fourWheeler() {
    print("This is a Four Wheeler Vehicle");
  }
}


class Car extends FourWheeler {
  void car() {
    print("This 4 wheeler vehicle is Car");
  }
}

// Hierarchical Inheritance

class VehicleHI {
  void vehicle() {
    print("This is a Vehicle");
  }
}

class CarHI extends VehicleHI {
  void car() {
    print("This vehicle is a Car");
  }
}

class BikeHI extends VehicleHI {
  void bike() {
    print("This vehicle is a Bike");
  }
}

// Multiple Inheritance (Through Interfaces) --> JaVa does not support multiple inheritance

class LandVehicle {
  void waterInfo() {
    print("This is a land vehicle");
  }
}

class WaterVehicle {
  void landInfo() {
    print("This is a water vehicle");
  }
}

class AmphibiousVehicle implements LandVehicle, WaterVehicle {
  @override
  void amphibiousInfo() {
    print("This is a amphibious vehicle");
  }

  @override
  void landInfo() {
    // TODO: implement landInfo
  }

  @override
  void waterInfo() {
    // TODO: implement waterInfo
  }

}

