import 'package:flutter/material.dart';
import 'package:snake/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SnakePage());
    }

    return MaterialPageRoute(builder: (_) => Container());
  }
}
