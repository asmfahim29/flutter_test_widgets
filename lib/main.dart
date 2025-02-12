import 'package:flutter/material.dart';
import 'package:widgets_test_screen/advance_widget_test/dart_define_test.dart';
import 'package:widgets_test_screen/animations/globe_of_icons_test.dart';
import 'package:widgets_test_screen/advance_widget_test/grid_screen_test.dart';
import 'package:widgets_test_screen/advance_widget_test/isolation_test_screen.dart';
import 'package:widgets_test_screen/advance_widget_test/listview_screen_test.dart';
import 'package:widgets_test_screen/animations/product_animations.dart';
import 'package:widgets_test_screen/helper_class/icons_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Screen',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: ProductDetailAnimation(),
    );
  }
}
