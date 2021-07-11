import 'dart:async';

import 'package:flutter/material.dart';

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

class SnakeGame extends StatefulWidget {
  final Size size;
  const SnakeGame({Key? key, required this.size}) : super(key: key);

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  var snake = [35, 55, 75, 95];

  late int axisX;
  late int axisY;

  @override
  void initState() {
    super.initState();

    axisX = widget.size.width ~/ 20;
    axisY = ((widget.size.height - kToolbarHeight) ~/ 20) * axisX;

    Timer.periodic(Duration(milliseconds: 500), (_) {
      updateSnake();
    });
  }

  void updateSnake() {
    if (snake.last > axisY) {
      snake.add(snake.last - axisY);
    } else {
      snake.add(snake.last + axisX);
    }

    snake.removeAt(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: axisY,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisX,
      ),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.all(2),
        color: snake.contains(index) ? Colors.green : Colors.grey[200],
      ),
    );
  }
}
