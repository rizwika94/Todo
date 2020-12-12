import 'package:flutter/material.dart';
import 'package:todo_app/navigation/routes.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/screen1.dart';

import 'package:todo_app/screens/screen2.dart';
import 'package:todo_app/screens/splash_screen.dart';
import 'package:todo_app/utils/keys.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TDRoutes.splash:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                SplashScreen(key: Key(Keys.splash)),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);

      case TDRoutes.screen2:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                EditTodoList(),
            // Screen2(key: Key(Keys.screen2)),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });

      case TDRoutes.screen1:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) => TodoList(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });

      case TDRoutes.home:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                HomeScreen(key: Key(Keys.home)),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
      default:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                SplashScreen(key: Key(Keys.splash)),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
    }
  }
}
