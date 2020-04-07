import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class NativeHardware {
  static const MethodChannel _channel = const MethodChannel('native_hardware');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

// get battery level
  String _batteryLevel = "Unknown battery leverl";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel = "";
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      batteryLevel = "Battery level at: $result";
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: ${e.message}";
    }
  }
}
