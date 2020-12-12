import 'package:flutter/widgets.dart';

import 'device_utils.dart';

class ScreenUtils {
  /// The device's screen width in physical pixels
  static double width(BuildContext context) {
    var ratio = MediaQuery.of(context).devicePixelRatio;
    var size = DeviceUtils.isIOS()
        ? MediaQuery.of(context).size.width * ratio
        : MediaQuery.of(context).size.width;
    return size.roundToDouble();
  }

  /// The device's screen height in physical pixels
  static double height(BuildContext context) {
    var ratio = MediaQuery.of(context).devicePixelRatio;
    var size = DeviceUtils.isIOS()
        ? MediaQuery.of(context).size.height * ratio
        : MediaQuery.of(context).size.height;
    return size.roundToDouble();
  }

  /// The ratio of the device's physical pixels to logical pixels
  static double pixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }
}

class ScreenArguments {
  final List<dynamic> args;
  ScreenArguments(this.args);
}
