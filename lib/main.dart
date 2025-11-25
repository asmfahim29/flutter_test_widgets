import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:widgets_test_screen/advance_widget_test/animated_drop_down.dart';
import 'package:widgets_test_screen/advance_widget_test/neumophic_validation_field.dart';
import 'package:widgets_test_screen/advance_widget_test/video_progress_bar.dart';
import 'package:widgets_test_screen/boilerplate_widget_with_getwidget/build_boiler_plat_widget_with_getwidget_package.dart';
import 'package:widgets_test_screen/boilerplate_widget_with_getwidget/product_horizontal_list_card.dart';
import 'advance_widget_test/drag_to_position_change.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initServices();
  runApp(MyApp());

}

initServices() async {
  const mode = String.fromEnvironment('mode', defaultValue: 'DEV');
  if(mode == "LIVE"){
    // set your production based url
  } else if (mode == "DEV") {
    // set your development based url
  }
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
      home: ProductCardList(),
    );
  }
}

class DockDemo extends StatelessWidget {
  const DockDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      DockItem(
        icon: Icons.home,
        iconColor: Colors.white,
        backgroundColor: Colors.redAccent,
      ),
      DockItem(
        icon: Icons.search,
        iconColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      DockItem(
        icon: Icons.settings,
        iconColor: Colors.white,
        backgroundColor: Colors.amber,
      ),
      DockItem(
        icon: Icons.favorite,
        iconColor: Colors.white,
        backgroundColor: Colors.pink,
      ),
      DockItem(
        icon: Icons.camera_alt,
        iconColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: MacosDock<DockItem>(
          items: items,
          builder: (item, scale) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 64 * scale,
                height: 64 * scale,
                decoration: BoxDecoration(
                  color: item.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  item.icon,
                  color: item.iconColor,
                  size: 24 * scale,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DockItem {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  DockItem({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });
}