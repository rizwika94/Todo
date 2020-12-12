import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class TDIcons {
  static Widget splashBackground({double height, double width}) {
    return SvgPicture.asset(
      'storybook/assets/icons/splash_bg.svg',
      width: width,
      height: height,
      color: Colors.blue,
    );
  }
}
