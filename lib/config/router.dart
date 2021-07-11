import 'package:flutter/material.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/main.dart';
import 'package:snake/pages/menu_page.dart';
import 'package:snake/pages/select_level_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MenuPage());
      case '/levels':
        return MaterialPageRoute(builder: (_) => SelectLevelPage());
      case '/level/1':
        return MaterialPageRoute(builder: (_) => SnakePage(width: Levels.one));
      case '/level/2':
        return MaterialPageRoute(builder: (_) => SnakePage(width: Levels.two));
      case '/level/3':
        return MaterialPageRoute(builder: (_) => SnakePage(width: Levels.three));
      case '/level/4':
        return MaterialPageRoute(builder: (_) => SnakePage(width: Levels.four));
      case '/level/5':
        return MaterialPageRoute(builder: (_) => SnakePage(width: Levels.five));
    }

    return MaterialPageRoute(builder: (_) => Container());
  }
}
