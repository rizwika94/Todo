import 'package:flutter/material.dart';

import 'navigation/router.dart';
import 'navigation/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fantrado Demo',
      color: Colors.white,
      // hide debug banner
      debugShowCheckedModeBanner: false,
      initialRoute: TDRoutes.splash,
      onGenerateRoute: Router.generateRoute,
      navigatorObservers: <NavigatorObserver>[TDRoutes.routeObserver],
    );
  }
}
