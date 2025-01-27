void main() {
  /// Mixin Do not make parent child relation, reusability of code

  final animal = Animal();

  animal.fun();
}

mixin Jump {
  int jumping = 10;
}

class Animal with Jump {
  void fun() {
    print("Animal can Jump : $jumping cm");
  }
}
