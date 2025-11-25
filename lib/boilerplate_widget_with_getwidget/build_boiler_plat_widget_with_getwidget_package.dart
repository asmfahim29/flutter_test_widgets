import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets_test_screen/boilerplate_widget_with_getwidget/boiler_buttons.dart';

class BoilerPlateWidgetWithGetWidget extends StatefulWidget {
  const BoilerPlateWidgetWithGetWidget({super.key});

  @override
  State<BoilerPlateWidgetWithGetWidget> createState() => _BoilerPlateWidgetWithGetWidgetState();
}

class _BoilerPlateWidgetWithGetWidgetState extends State<BoilerPlateWidgetWithGetWidget> {
  final String _playStoreLink =
      'https://play.google.com/store/apps/details?id=dev.getflutter.appkit';
  // final String _appStoreLink = 'Coming Soon';
  final String _githuAppRepoLink =
      'https://github.com/ionicfirebaseapp/getwidget-app-kit';
  final String _githubLibraryRepoLink =
      'https://github.com/ionicfirebaseapp/getwidget';

  Future _launchUrl(url) async {
    if (await canLaunchUrl(url)) {
      return await canLaunchUrl(url);
    }
    return Future.value(false);
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GFColors.DARK,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              // _launchUrl(_githubLibraryRepoLink);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BoilerButtons()));
            },
            child: SvgPicture.asset('assets/product_images/facebook.svg'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Center(
                  child: Text(
                    'To keep library size small and code clean we manage example on different repository. which includes clear usage of each and every component that we provide in GetWidget library. Please have a look there.',
                    style: TextStyle(
                      fontSize: 16,
                      color: GFColors.WHITE,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GFButton(
                  size: GFSize.LARGE,
                  text: 'View on Github',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: GFColors.WHITE,
                  ),
                  icon: SvgPicture.asset(
                    'assets/product_images/apple.svg',
                    height: 22,
                  ),
                  color: GFColors.SUCCESS,
                  blockButton: true,
                  onPressed: () {
                    _launchUrl(_githuAppRepoLink);
                  }),
            ],
          ),
          Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: Center(
                  child: Text(
                    'We also have same app on playstore. It shows various possibilities that you can achieve using GetWidget library.',
                    style: TextStyle(
                      fontSize: 16,
                      color: GFColors.WHITE,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GFButton(
                  size: GFSize.LARGE,
                  text: 'View on Playstore',
                  textStyle:
                  const TextStyle(fontSize: 16, color: GFColors.WHITE),
                  icon: SvgPicture.asset(
                    'assets/product_images/google.svg',
                    height: 20,
                  ),
                  color: GFColors.SUCCESS,
                  blockButton: true,
                  onPressed: () {
                    _launchUrl(_playStoreLink);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
