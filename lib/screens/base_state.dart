import 'package:flutter/material.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  void closeScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void baseMethod() {
    // Parent method
  }
}
