void main() {
  Map<String, int> ageMap = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 28,
  };

  print(ageMap); // Output: {Alice: 25, Bob: 30, Charlie: 28}


  Map<String, String> countries = Map();
  countries['Bangladesh'] = 'Dhaka';
  countries['USA'] = 'Washington, D.C.';
  countries['UK'] = 'London';

  print(countries); // Output: {Bangladesh: Dhaka, USA: Washington, D.C., UK: London}


  Map<int, String> studentRoll = {
    101: 'John',
    102: 'Emma',
    103: 'Oliver',
  };

  print(studentRoll); // Output: {101: John, 102: Emma, 103: Oliver}



  Map<String, int> constants = Map.unmodifiable({
    'pi': 3,
    'gravity': 9,
  });

  // constants['pi'] = 3.14; // This will throw an error!
  print(constants); // Output: {pi: 3, gravity: 9}


  Map<String, int> scores = {};

  scores['Alice'] = 95; // Add a new key-value pair
  scores['Bob'] = 87;
  scores.update('Alice', (value) => 98); // Update Alice's score

  print(scores); // Output: {Alice: 98, Bob: 87}



  Map<String, int> marks = {'Math': 90, 'Science': 85, 'English': 88};

  marks.remove('Science'); // Removes key 'Science'
  print(marks); // Output: {Math: 90, English: 88}

  marks.clear(); // Removes all key-value pairs
  print(marks); // Output: {}


  Map<String, String> capitals = {'France': 'Paris', 'Japan': 'Tokyo'};

  print(capitals['France']); // Output: Paris
  print(capitals.containsKey('Japan')); // Output: true
  print(capitals.containsValue('New York')); // Output: false



  Map<String, int> population = {'India': 1380, 'USA': 331, 'Brazil': 213};

  // Using forEach
  population.forEach((key, value) {
    print('$key has a population of $value million');
  });

  // Using for-in loop
  for (var entry in population.entries) {
    print('${entry.key}: ${entry.value}');
  }



  Map<String, int> stock = {'Apple': 10, 'Banana': 20, 'Mango': 15};

  print(stock.keys); // Output: (Apple, Banana, Mango)
  print(stock.values); // Output: (10, 20, 15)


  Map<String, int> scores2 = {'Emma': 88, 'John': 95, 'Alice': 78};

  var sortedEntries = scores2.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value)); // Sort by value

  var sortedMap = Map.fromEntries(sortedEntries);
  print(sortedMap); // Output: {Alice: 78, Emma: 88, John: 95}

  Map<String, int> ageMap2 = {'Alice': 25};

  ageMap2.putIfAbsent('Bob', () => 30);
  print(ageMap2); // Output: {Alice: 25, Bob: 30}






}
