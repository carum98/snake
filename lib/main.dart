import 'package:flutter/material.dart';
import 'package:snake/config/router.dart';

import 'pages/snake_game.dart';

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
  final int width;
  const SnakePage({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level'),
        centerTitle: true,
      ),
      body: SnakeGame(
        size: MediaQuery.of(context).size,
        width: width,
      ),
    );
  }
}
