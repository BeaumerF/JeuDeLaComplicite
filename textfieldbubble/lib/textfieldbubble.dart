
import 'dart:async';

import 'package:flutter/services.dart';

class Textfieldbubble {
  static const MethodChannel _channel =
      const MethodChannel('textfieldbubble');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
