void main() {

  /// Number
   var intNumber = 10;
   var doubleNumber = 10.10;
   print(intNumber.runtimeType);
   print(doubleNumber.runtimeType);


   /// String
  var singleQuoteString = 'This is a single quote string';
  var doubleQuoteString = "This is a double quote string";

  print(singleQuoteString);
  print(doubleQuoteString);

  /// Boolean
  var positive = true;
  var negative = false;

  print('is Bangladeshi? $positive');
  print('not Muslim? $negative');


  /// List/Array
  var list = [1,2,3];
  var list2 = ['Dhaka','Khulna','Barishal', 'Rangpur', 'Dinajpur', 'Cumilla', 'Rajshahi', 'Chittagong'];
  var list3 = [1, 2.2, 333.222, 'Fahim'];


  print('$list \n\n\n $list2 \n\n\n $list3');


  /// Map
  var map = {'name' : 'fahim', 'id': 1103029, 'address' : 'Dhaka'};
  print(map);


  /// Operators
   int a = 10, b = 3;
   double x = 5.5, y = 2.5;
   bool flag1 = true, flag2 = false;
   int? nullable;
   int c = 5;

   // Arithmetic Operators
   print('Addition: ${a + b}');       // +
   print('Subtraction: ${a - b}');    // -
   print('Multiplication: ${a * b}'); // *
   print('Division: ${x / y}');       // /
   print('Integer Division: ${a ~/ b}'); // ~/
   print('Modulo: ${a % b}');         // %

   // Assignment Operators
   c += 2; print('+= : $c'); // c = c + 2
   c -= 2; print('-= : $c'); // c = c - 2
   c *= 2; print('*= : $c'); // c = c * 2
   c ~/= 2; print('~/= : $c'); // c = c ~/ 2
   c %= 2; print('%= : $c'); // c = c % 2
   c &= 2; print('&= : $c'); // Bitwise AND assignment
   c |= 2; print('|= : $c'); // Bitwise OR assignment
   c ^= 2; print('^= : $c'); // Bitwise XOR assignment
   c <<= 1; print('<<= : $c'); // Left shift assignment
   c >>= 1; print('>>= : $c'); // Right shift assignment
   c >>>= 1; print('>>>= : $c'); // Unsigned right shift assignment (Dart 2.14+)

   // Comparison Operators
   print('Equal: ${a == b}');  // ==
   print('Not Equal: ${a != b}'); // !=
   print('Greater than: ${a > b}'); // >
   print('Less than: ${a < b}'); // <
   print('Greater or Equal: ${a >= b}'); // >=
   print('Less or Equal: ${a <= b}'); // <=

   // Logical Operators
   print('Logical AND: ${flag1 && flag2}'); // &&
   print('Logical OR: ${flag1 || flag2}'); // ||
   print('Logical NOT: ${!flag1}'); // !

   // Bitwise Operators
   print('Bitwise AND: ${a & b}'); // &
   print('Bitwise OR: ${a | b}'); // |
   print('Bitwise XOR: ${a ^ b}'); // ^
   print('Bitwise NOT: ${~a}'); // ~
   print('Left Shift: ${a << 1}'); // <<
   print('Right Shift: ${a >> 1}'); // >>
   print('Unsigned Right Shift: ${a >>> 1}'); // >>> (Dart 2.14+)

   // Conditional Operators
   print('Ternary Operator: ${a > b ? "a is greater" : "b is greater"}'); // ?:
   print('Null Coalescing: ${nullable ?? 100}'); // ??
   nullable ??= 20; print('??= assignment: $nullable'); // ??=

   // Increment & Decrement Operators
   int d = 5;
   print('Pre-increment: ${++d}'); // ++d
   print('Post-increment: ${d++}, After increment: $d'); // d++
   print('Pre-decrement: ${--d}'); // --d
   print('Post-decrement: ${d--}, After decrement: $d'); // d--

   // Type Test Operators
   print('Is operator: ${x is double}'); // is
   print('Is Not operator: ${x is! int}'); // is!
   var z = y as double; print('As operator: $z'); // as

   // Cascade Notation
   var buffer = StringBuffer()
     ..write('Hello')
     ..write(' World!');
   print(buffer.toString()); // ..

   // Null-aware Access
   String? nullableString;
   print('Null-aware access: ${nullableString?.length}'); // ?.




}
