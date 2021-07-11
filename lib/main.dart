import 'package:flutter/material.dart';

import 'SnakeGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SnakePage(),
    );
  }
}

class SnakePage extends StatelessWidget {
  const SnakePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: SnakeGame(
          size: MediaQuery.of(context).size,
        ),
      ),
    );
  }
}
