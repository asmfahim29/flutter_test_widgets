import 'dart:math';

import 'package:flutter/material.dart';

class GestureDetectorTestScreen extends StatefulWidget {
  const GestureDetectorTestScreen({super.key});

  @override
  State<GestureDetectorTestScreen> createState() => _GestureDetectorTestScreenState();
}

class _GestureDetectorTestScreenState extends State<GestureDetectorTestScreen> {
  String? text = 'drag me';
  Color? containerColor = Colors.blue;
  String? seriesNumber = '4';
  double _scaleFactor = 1.0;
  double _initialScale = 1.0;
  double _rotation = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Test'),
      ),
      body: seriesNumber == '4'
          ? GestureDetector(
              onScaleStart: (details) {
                _initialScale = _scaleFactor;
                // print("-========------$_initialScale");
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scaleFactor = (_initialScale * details.scale);

                  print("-========------$_scaleFactor");
                  // Clamp ensures the scale factor stays within reasonable bounds
                });

              },
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Text(
                    "FLUTTER",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: _scaleFactor,

                  ),
                ),
              ),
            )
          : GestureDetector(
              onHorizontalDragUpdate: (details) {
                print('Container horizontal drag start');
                if (details.delta.dx > 0) {
                  setState(() {
                    text = 'Dragged to right';
                    containerColor = Colors.red;
                  });
                } else {
                  setState(() {
                    text = 'Dragged to left';
                    containerColor = Colors.green;
                  });
                }
              },
              onVerticalDragUpdate: (details) {
                print('Container horizontal drag start');
                if (details.delta.dy > 0) {
                  setState(() {
                    text = 'Dragged to down';
                    containerColor = Colors.pink;
                  });
                } else {
                  setState(() {
                    text = 'Dragged to top';
                    containerColor = Colors.yellow;
                  });
                }
              },
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: containerColor,
                ),
                child: Center(
                  child: Text(
                    text!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
