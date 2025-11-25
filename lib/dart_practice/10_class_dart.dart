void main(){
  /*var account = Encapsulation();
  account.deposit(100);
  account.withdraw(50);
  print(account.getBalance());*/

  /*var vehicle = Car();
  vehicle.start();
  vehicle.drive();


  var bike = Bike();
  bike.start();
  bike.brake();*/

  /*
  List<Polymorphism> animals = [Dog(), Cat()];
  for(var animal in animals){
    animal.makeSound();
  }
*/

  Abstraction payment = CreditCardPayment();
  payment.processPayment(100);

}



class Encapsulation {
  double _balance = 0;


  void deposit(double amount){
    _balance += amount;
  }


  void withdraw(double amount){
    _balance -= amount;
  }

  double getBalance(){
    return _balance;
  }
}

class Inheritance {
  void start() {
    print("Starting...");
  }

  void honk() {
    print("Honking...");
  }

}

class Car extends Inheritance {
  void drive() {
    print("Driving...");
  }
}

class Bike extends Inheritance {
  void brake() {
    print("Braking...");
  }
}


class Polymorphism {
  void makeSound() {
    print("Making sound...");
  }
}


class Dog extends Polymorphism {
  @override
  void makeSound() {
    print("Woof woof!");
  }
}

class Cat extends Polymorphism {
  @override
  void makeSound() {
    print("Meow meow!");
  }
}

abstract class Abstraction {
  void processPayment(double amount);
}

class CreditCardPayment implements Abstraction {
  @override
  void processPayment(double amount) {
    print("Processing credit card payment of $amount");
  }
}

class PayPalPayment implements Abstraction {
  @override
  void processPayment(double amount) {
    print("Processing PayPal payment of $amount");
  }
}

class CashPayment implements Abstraction {
  @override
  void processPayment(double amount) {
    print("Processing cash payment of $amount");
  }
}

