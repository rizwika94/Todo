import 'package:flutter/material.dart';

class StrikeThrough extends StatelessWidget {
  final String text;
  final bool isChecked;
  StrikeThrough(this.text, this.isChecked) : super();

  Widget _widget() {
    if (isChecked) {
      return Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
          fontSize: 22.0,
          color: Colors.red[200],
        ),
      );
    } else {
      return Text(
        text,
        style: TextStyle(fontSize: 22.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _widget();
  }
}
