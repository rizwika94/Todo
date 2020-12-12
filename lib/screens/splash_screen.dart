import 'package:flutter/material.dart';
import 'package:todo_app/navigation/routes.dart';
import 'package:todo_app/resources/icons.dart';
import 'package:todo_app/utils/screen_utils.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    moveNextScreen(context);
    double width = ScreenUtils.width(context);
    double height = ScreenUtils.height(context);
    return Container(
      color: Colors.white,
      child: Stack(children: <Widget>[
        TDIcons.splashBackground(width: width, height: height),
      ]),
    );
  }

  void moveNextScreen(BuildContext context) {
    Future.delayed(const Duration(microseconds: 3000), () {
      Navigator.pushNamed(context, TDRoutes.screen1);
    });
  }
}
