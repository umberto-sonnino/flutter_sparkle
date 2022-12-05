import 'dart:async';

import 'package:flutter/services.dart';

class FlutterSparkle {
  static const MethodChannel _channel = MethodChannel('flutter_sparkle');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> checkMacUpdate(String feedUrl) async {
    // TODO: do we need a String result? Maybe revert this.
    final String? res = await _channel.invokeMethod('checkMacUpdate', feedUrl);
    return res;
  }

  static void checkWinUpdate() {
    _channel.invokeMethod('checkWinUpdate');
  }

  static void checkWinUpdateAndInstall() {
    _channel.invokeMethod('checkWinUpdateAndInstall');
  }

  static void checkWinUpdateWithoutUI() {
    _channel.invokeMethod('checkWinUpdateWithoutUI');
  }

  static Future<String?> initWinUpdate(String feedUrl) async {
    // TODO: is this using the URL from the feed too? Need to test on Windows...
    final String? url =
        await _channel.invokeMethod('initWinSparkle', {'feedUrl': feedUrl});
    return url;
  }
}
