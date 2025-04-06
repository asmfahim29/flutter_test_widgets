import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double height = 100;
  double width = 100;
  Color color = Colors.amber;
  BorderRadiusGeometry radiusGeometry = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              height: height,
              width: width,
              decoration:
              BoxDecoration(color: color, borderRadius: radiusGeometry),
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: IconButton(
                onPressed: () {
                  final random = Random();
                  height = random.nextInt(150).toDouble();
                  width = random.nextInt(300).toDouble();

                  color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                      random.nextInt(256), 1);

                  radiusGeometry =
                      BorderRadius.circular(random.nextInt(100).toDouble());
                  setState(() {});
                },
                icon: const Icon(Icons.refresh)),
          )
        ],
      ),
    );
  }
}
