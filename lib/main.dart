import 'package:flutter/material.dart';
import 'package:snake/router.dart';

import 'snake_game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class SnakePage extends StatelessWidget {
  const SnakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.grey,
        child: SnakeGame(
          size: MediaQuery.of(context).size,
        ),
      ),
    );
  }
}
