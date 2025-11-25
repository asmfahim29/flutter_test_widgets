void main () {
  UserService userService = UserService(Logger());
  userService.createUser();

  OrderService orderService = OrderService(ProductValidator(), Logger());
  orderService.createOrder(Product("Apple", 10, 5));
  orderService.createOrder(Product("Orange", 20, 5));
  orderService.createOrder(Product("Banana", 0, 5));
}

class Logger {
  void log(String msg) {
    print("Logger print: $msg");
  }
}

class UserService {
  final Logger _logger;

  UserService(this._logger);

  void createUser() {
    _logger.log("A New user is created successfully");
  }
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

class OrderService {
  final ProductValidator _productValidator;
  final Logger  _logger;
  OrderService(this._productValidator, this._logger);

  void createOrder(Product product) {
    if (_productValidator.isValid(product)) {
      _logger.log("${product.name} Order is created successfully");
    } else {
      _logger.log("${product.name} Order is not valid");
    }
  }

}

class ProductValidator {

  bool isValid(Product product) {
    if (product.price > 0 && product.quantity > 0) {
      return true;
    }
    return false;
  }
}