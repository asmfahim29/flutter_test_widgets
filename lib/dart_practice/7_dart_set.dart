void main() {

  Set<int> numbers = {1, 2, 3, 4, 5};
  print(numbers); // Output: {1, 2, 3, 4, 5}

  numbers.clear();

  print(numbers.hashCode);

  Set<String> fruits = Set();
  fruits.add('Apple');
  fruits.add('Banana');
  fruits.add('Orange');

  print(fruits); // Output: {Apple, Banana, Orange}


  Set<double> prices = {19.99, 25.50, 30.75};
  print(prices); // Output: {19.99, 25.5, 30.75}


  Set<String> colors = Set.unmodifiable({'Red', 'Green', 'Blue'});

  // colors.add('Yellow'); // This will throw an error!
  print(colors); // Output: {Red, Green, Blue}


  /// Adding
  Set<int> numbers2 = {1, 2, 3};
  numbers.add(4);
  numbers.addAll({5, 6, 7});

  print(numbers); // Output: {1, 2, 3, 4, 5, 6, 7}


  /// Removing
  Set<String> cities = {'New York', 'London', 'Tokyo'};
  cities.remove('London'); // Removes 'London'

  print(cities); // Output: {New York, Tokyo}



  /// Checking if exist
  Set<int> nums = {10, 20, 30};
  print(nums.contains(20)); // Output: true


  /// Iterating over a set
  Set<String> animals = {'Cat', 'Dog', 'Elephant'};

  // Using forEach
  animals.forEach((animal) => print(animal));

  // Using for-in loop
  for (var animal in animals) {
    print(animal);
  }


  /// Union operation
  Set<int> setA = {1, 2, 3};
  Set<int> setB = {3, 4, 5};

  print(setA.union(setB)); // Output: {1, 2, 3, 4, 5}


  /// Intersection
  Set<int> setA1 = {1, 2, 3};
  Set<int> setB1 = {3, 4, 5};

  print(setA1.intersection(setB1)); // Output: {3}


  /// Set Difference
  Set<int> setA2 = {1, 2, 3};
  Set<int> setB2 = {3, 4, 5};

  print(setA2.difference(setB2)); // Output: {1, 2}


  /// Converting a List to a set
  List<int> numbers3 = [1, 2, 2, 3, 4, 4, 5];
  Set<int> uniqueNumbers = numbers3.toSet();

  print(uniqueNumbers); // Output: {1, 2, 3, 4, 5}


  /// Getting Set Length
  Set<String> names = {'Alice', 'Bob', 'Charlie'};
  print(names.length); // Output: 3



  /// Clearing a Set
  Set<String> fruits1 = {'Apple', 'Banana', 'Mango'};
  fruits1.clear();

  print(fruits1); // Output: {}





}
