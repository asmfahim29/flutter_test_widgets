void main () {
  var product1 = Product('Laptop', 1000.0, 2);
  var product2 = Product('Mouse', 50.0, 5);
  var product3 = Product('Keyboard', 20.0, 10);

  var order = Order([product1, product2, product3]);

  print('Total Price: ${order.calculateTotalPrice()}');

  var employee1 = Employee('John', 5000.0, 40);
  var employee2 = Employee('Mike', 3000.0, 25);
  var employee3 = Employee('Sarah', 4000.0, 35);


  print('Bonus for ${employee1.name}: ${employee1.calculateBonus()}');
}

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  double get totalPrice {
    return price * quantity;
  }
}


class Order {
  List<Product> products;

  Order(this.products);

  double calculateTotalPrice() {
    double sum = 0.0;
    for (int i = 0 ; i < products.length; i++){
      sum = (sum + products[i].totalPrice).toDouble();
    }
    return sum;
  }
}

class Employee {
  String name;
  double salary;
  int age;

  Employee(this.name, this.salary, this.age);

  double calculateBonus() {
    if (age > 30) {
      return salary * 0.1;
    } else {
      return 0.0;
    }
  }
}