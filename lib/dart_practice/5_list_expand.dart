void main() {
  /// Fixed Length List
  List<int> numbers = List.filled(5,
      0); // Creates a fixed-length list with 5 elements (all initialized to 0)
  numbers[0] = 10;
  numbers[1] = 20;
  print(numbers); // Output: [10, 20, 0, 0, 0]

  /// Growable List
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  fruits.add('Orange'); // Adding an element
  fruits.remove('Banana'); // Removing an element
  print(fruits); // Output: [Apple, Mango, Orange]

  /// Typed List (Generic List)
  List<int> evenNumbers = [2, 4, 6, 8, 10]; // List of integers
  List<String> names = ['Alice', 'Bob', 'Charlie']; // List of strings
  print(evenNumbers);
  print(names);

  /// Immutable List(Unmodifiable)
  List<String> colors = List.unmodifiable(['Red', 'Green', 'Blue']);
  // colors.add('Yellow'); // This will throw an error
  print(colors); // Output: [Red, Green, Blue]

  /// Adding Elements in a List
  List<int> numbers2 = [];
  numbers2.add(5);
  numbers2.addAll([10, 15, 20]); // Adding multiple elements
  print(numbers2); // Output: [5, 10, 15, 20]

  numbers2.insertAll(1, [2,3,10,25,45,58,59]);
  print("inserted all : $numbers2");

  /// Removing Elements in List
  List<String> cities = ['Dhaka', 'London', 'New York'];
  cities.remove('London'); // Removes 'London'
  cities.removeAt(0); // Removes the first element
  print(cities); // Output: ['New York']

  /// Accessing elements in List
  List<int> nums = [10, 20, 30, 40, 50];
  print(nums[2]); // Output: 30
  print(nums.first); // Output: 10
  print(nums.last); // Output: 50

  /// Looping through a list
  List<String> animals = ['Cat', 'Dog', 'Elephant'];

  // Using for loop
  for (int i = 0; i < animals.length; i++) {
    print(animals[i]);
  }

  // Using forEach
  animals.forEach((animal) => print(animal));

  // Using for-in loop
  for (var animal in animals) {
    print(animal);
  }

  /// Sorting a list
  List<int> numbers3 = [5, 2, 8, 1, 3];
  numbers3.sort();
  print(numbers3); // Output: [1, 2, 3, 5, 8]

  /// List Contains an Element
  List<String> fruits2 = ['Apple', 'Banana', 'Mango'];
  print(fruits2.contains('Banana')); // Output: true
}
