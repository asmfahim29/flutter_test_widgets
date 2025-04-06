import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_test_screen/advance_widget_test/animated_container.dart';
import 'package:widgets_test_screen/advance_widget_test/animated_profile_image_picker.dart';
import 'package:widgets_test_screen/advance_widget_test/animated_text_kit.dart';
import 'package:widgets_test_screen/advance_widget_test/book_seat_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/choice_chip_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/custom_gridview_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/custom_wheel_time_picker_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/dart_define_test.dart';
import 'package:widgets_test_screen/advance_widget_test/default_grid_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/email_pass_field.dart';
import 'package:widgets_test_screen/advance_widget_test/grid_tile_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/horizontal_stepper_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/listview_2d.dart';
import 'package:widgets_test_screen/advance_widget_test/listview_recordable_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/long_press.dart';
import 'package:widgets_test_screen/advance_widget_test/meteor_shower.dart';
import 'package:widgets_test_screen/advance_widget_test/rotating_text.dart';
import 'package:widgets_test_screen/advance_widget_test/sliver_test_screen.dart';
import 'package:widgets_test_screen/advance_widget_test/social_reaction_tile_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/stack_card_toggle.dart';
import 'package:widgets_test_screen/advance_widget_test/stack_screen_test.dart';
import 'package:widgets_test_screen/advance_widget_test/staggerred_grid_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/star_animation_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/tabto_expand.dart';
import 'package:widgets_test_screen/advance_widget_test/translator_widget.dart';
import 'package:widgets_test_screen/advance_widget_test/whatsapp_circle_avatar_widget.dart';
import 'package:widgets_test_screen/animations/globe_of_icons_test.dart';
import 'package:widgets_test_screen/advance_widget_test/grid_screen_test.dart';
import 'package:widgets_test_screen/advance_widget_test/isolation_test_screen.dart';
import 'package:widgets_test_screen/advance_widget_test/listview_screen_test.dart';
import 'package:widgets_test_screen/animations/product_animations.dart';
import 'package:widgets_test_screen/helper_class/icons_list.dart';

import 'advance_widget_test/animated_expanded_widget.dart';
import 'advance_widget_test/animated_neon_shadow.dart';
import 'advance_widget_test/3d_vinyl_widget.dart';
import 'advance_widget_test/drag_to_position_change.dart';
import 'advance_widget_test/modern_toast.dart';
import 'advance_widget_test/qr_code_widget.dart';

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
      home: ChoiceChipWidget(),
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