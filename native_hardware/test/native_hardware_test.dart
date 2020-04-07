import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_hardware/native_hardware.dart';

void main() {
  const MethodChannel channel = MethodChannel('native_hardware');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NativeHardware.platformVersion, '42');
  });
}
