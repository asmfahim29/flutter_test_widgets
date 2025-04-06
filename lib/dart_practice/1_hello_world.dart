void main() {

  print("Welcome to Dart: \n${DartLanguage().dartKeywords}");
  print("Welcome to Dart: \n${DartLanguage().dataTypes}");
  print("Welcome to Dart: \n${DartLanguage().dartOperators}");

}


/// Different types of Dart keywords in dart lang
class DartLanguage {
  List<String> dartKeywords = [
    'abstract', 'as', 'assert', 'async', 'await', 'break', 'case', 'catch',
    'class', 'const', 'continue', 'covariant', 'default', 'deferred', 'do',
    'dynamic', 'else', 'enum', 'export', 'extends', 'extension', 'external',
    'factory', 'false', 'final', 'finally', 'for', 'function', 'get', 'hide',
    'if', 'implements', 'import', 'in', 'inline', 'interface', 'is', 'late',
    'library', 'mixin', 'new', 'null', 'on', 'operator', 'part', 'required',
    'rethrow', 'return', 'set', 'show', 'static', 'super', 'switch', 'sync',
    'this', 'throw', 'true', 'try', 'typedef', 'var', 'void', 'while', 'with',
    'yield'
  ];

  List<String> dataTypes = ['Number', 'Strings', 'Boolean', 'Lists', 'Maps', 'Runes', 'Symbols'];

  void printKeyWords(){
    print(dartKeywords);
  }

  List<String> dartOperators = [
    // Arithmetic Operators
    '+', '-', '*', '/', '~/', '%',

    // Assignment Operators
    '=', '+=', '-=', '*=', '/=', '~/=', '%=', '&=', '|=', '^=', '>>=', '<<=', '>>>=' , '??=',

    // Comparison Operators
    '==', '!=', '>', '<', '>=', '<=',

    // Logical Operators
    '&&', '||', '!',

    // Bitwise Operators
    '&', '|', '^', '~', '<<', '>>', '>>>',

    // Conditional Operator
    '?:', '??', '??=',

    // Increment and Decrement Operators
    '++', '--',

    // Type Test Operators
    'is', 'is!', 'as',

    // Cascade Notation
    '..',

    // Null-aware Access
    '?.',
  ];

}