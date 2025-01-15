import 'package:flutter/material.dart';
import 'package:widgets_test_screen/advance_widget_test/sliver_test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Secure Storage',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: CustomScrollScreen(),
    );
  }
}
