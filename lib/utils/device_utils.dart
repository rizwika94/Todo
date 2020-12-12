import 'dart:io';

class DeviceUtils {
  /// Returns true if the device's host platform is IOS; false otherwise
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// Returns true if the device's host platform is Android; false otherwise
  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
