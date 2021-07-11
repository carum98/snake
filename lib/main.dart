import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: SnakeGame()),
    );
  }
}

class SnakeGame extends StatelessWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final axisX = size.width ~/ 20;
    final axixY = ((size.height - kToolbarHeight) ~/ 20) * axisX;

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: axixY,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisX,
      ),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.all(2),
        color: Colors.grey,
      ),
    );
  }
}
