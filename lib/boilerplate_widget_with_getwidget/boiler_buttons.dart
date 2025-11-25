import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class BoilerButtons extends StatelessWidget {
  const BoilerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GFImageOverlay(
              height: 200,
              width: 300,
              image: AssetImage('assets/product_images/background2.png')),
          SizedBox(
            height: 10,
          ),
          GFShimmer(
              child: Container(
            height: 30,
            width: 300,
            color: Colors.grey,
          )),
          SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              height: 60,
              width: 350,
              child: GFButton(
                onPressed: () {},
                child: Text("Click Me"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          GFImageOverlay(
            height: 200,
            width: 300,
            image: AssetImage('assets/product_images/day_light.jpg'),
            shape: BoxShape.circle,
            boxFit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),

          GFAvatar(
            // size: GFSize.LARGE,
              backgroundImage: NetworkImage(
                "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
              ),
              shape: GFAvatarShape.square,
          ),

          SizedBox(
            height: 10,
          ),

          GFIconBadge(
            child: GFIconButton(
              color: GFColors.TRANSPARENT,
              onPressed: (){},
              icon: Icon(Icons.notifications, size: 35,),
            ),
            counterChild: GFBadge(
              child: Text("300"),
              shape: GFBadgeShape.circle,
            ),
          ),

          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
