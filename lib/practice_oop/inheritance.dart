void main () {
  Dog puppy = Dog();
  puppy.eat();
  puppy.sleep();

  puppy.bark();

  Car car = Car();

  CarHI carHI = CarHI();
  BikeHI bikeHI = BikeHI();
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



