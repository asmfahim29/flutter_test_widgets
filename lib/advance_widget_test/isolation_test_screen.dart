import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateTestScreen extends StatelessWidget {
  const IsolateTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/gifs/Animation - 1737433374916.gif"),
              ElevatedButton(
                onPressed: () {
                  // Add your code here
                  complexTask1();
                },
                child: const Text("Test 1"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();
                  await Isolate.spawn(complexTask2, receivePort.sendPort);
                  receivePort.listen((total) {
                    debugPrint("-=-=-=-Result 2 is : $total");
                  });
                },
                child: const Text("Isolate Test"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();
                  await Isolate.spawn(
                      complexTask3, Data(500, receivePort.sendPort));
                  receivePort.listen((total) {
                    debugPrint("-=-=-=-Result 3 is : $total");
                  });
                },
                child: const Text("Isolate Test 2"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final receivePort = ReceivePort();
                  await Isolate.spawn(complexTask4,
                      (iteration: 100000000, sendPort: receivePort.sendPort));
                  receivePort.listen((total) {
                    debugPrint("-=-=-=-Result 4 is : $total");
                  });
                },
                child: const Text("Isolate Test 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  complexTask1() {
    var total = 0;
    for (int i = 0; i <= 99999999; i++) {
      total = total + i;
    }
    debugPrint("-=-=-=-total is : $total");
  }
}

/// --- End of Main Screen ----

///Isolate example 1
complexTask2(SendPort sendPort) async {
  var total = 0;
  for (int i = 0; i <= 99999999; i++) {
    total = total + i;
  }
  sendPort.send(total);
}

/// Isolate example 2
complexTask3(Data data) async {
  var total = 0;
  for (int i = 0; i <= data.iteration; i++) {
    total = total + i;
  }
  data.sendPort.send(total);
}

class Data {
  int iteration;
  final SendPort sendPort;

  Data(this.iteration, this.sendPort);
}

/// Isolate example 3
complexTask4(({int iteration, SendPort sendPort}) data) async {
  var total = 0;
  for (int i = 0; i <= data.iteration; i++) {
    total = total + i;
  }
  data.sendPort.send(total);
}
