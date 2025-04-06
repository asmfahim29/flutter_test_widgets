import 'package:flutter/material.dart';

class StackScreenTest extends StatefulWidget {
  const StackScreenTest({super.key});

  @override
  State<StackScreenTest> createState() => _StackScreenTestState();
}

class _StackScreenTestState extends State<StackScreenTest> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Icon(
                  Icons.mail_outline_sharp,
                  size: 50,
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: _buildBadge(),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: Text("Add Count"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
    String badgeText = "${_counter * 9999}";

    // Measure text size
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: badgeText,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    double badgeWidth = textPainter.width + 10; // Add padding
    double badgeHeight = 35;

    return Container(
      height: badgeHeight,
      width: badgeWidth,
      decoration: BoxDecoration(
        color: Colors.red.shade300,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(badgeHeight / 2),
      ),
      child: Center(
        child: Text(
          badgeText,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

