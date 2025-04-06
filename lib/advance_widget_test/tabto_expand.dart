import 'package:flutter/material.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

class TapToExpend extends StatelessWidget {
  const TapToExpend({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: TapToExpand(
          //curve: Curves.easeIn,
          content: Column(
            children: <Widget>[
              for (var i = 0; i < 15; i++)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    "data $i",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
            ],
          ),
          title: const Text(
            'TapToExpand',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          closedHeight: 90,
          borderRadius: 10.0,
          openedHeight: 600,
        ),
      ),
    );
  }
}
