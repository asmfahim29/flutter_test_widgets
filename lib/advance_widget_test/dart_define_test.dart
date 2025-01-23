import 'package:flutter/material.dart';
import 'package:widgets_test_screen/api_dev/const.dart';
import 'package:widgets_test_screen/api_dev/endpoints.dart';

class DartDefineTestScreen   extends StatelessWidget {
  const DartDefineTestScreen({super.key});


  getData() {
    var url = Uri.parse(Endpoints.baseUrl + Endpoints.getInfo);
    var header = {'api_key' : Const.apiKey, 'secret_key' : Const.secretKey};

    debugPrint("Details => Url : $url  \nHeader : $header");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("FLUTTER ENV TEST"),

            Container(
              height: 50,
              width: 200,
              margin: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: (){
                    getData();
                  },
                  child: Text("Test")),
            ),
          ],
        ),
      ),
    );
  }
}
