import 'package:flutter/material.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/pages/menu_page.dart';
import 'package:snake/pages/select_level_page.dart';
import 'package:snake/pages/setting_page.dart';
import 'package:snake/pages/snake_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MenuPage());
      case '/levels':
        return MaterialPageRoute(builder: (_) => SelectLevelPage());
      case '/level/1':
        return MaterialPageRoute(builder: (_) => SnakePage(level: Levels.One));
      case '/level/2':
        return MaterialPageRoute(builder: (_) => SnakePage(level: Levels.Two));
      case '/level/3':
        return MaterialPageRoute(builder: (_) => SnakePage(level: Levels.Three));
      case '/level/4':
        return MaterialPageRoute(builder: (_) => SnakePage(level: Levels.Four));
      case '/level/5':
        return MaterialPageRoute(builder: (_) => SnakePage(level: Levels.Five));
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingPage());
    }

    return MaterialPageRoute(builder: (_) => Container());
  }
}
