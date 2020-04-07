library hello;

import 'package:url_launcher/url_launcher.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// A Helloer
class Hello {
  String sayHello(name) {
    final str = "hi, $name";
    return str;
  }
}
