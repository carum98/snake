import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake/direction.dart';

class SnakeGame extends StatefulWidget {
  final Size size;
  const SnakeGame({Key? key, required this.size}) : super(key: key);

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  List<int> snake = [35, 55, 75, 95];

  Direction direction = Direction.Down;

  late int axisX;
  late int axisY;

  @override
  void initState() {
    super.initState();

    axisX = widget.size.width ~/ 20;
    axisY = ((widget.size.height - kToolbarHeight) ~/ 20) * axisX;

    Timer.periodic(Duration(milliseconds: 500), (_) {
      update();
    });
  }

  void update() {
    switch (direction) {
      case Direction.Down:
        if (snake.last > axisY) {
          snake.add(snake.last - axisY);
        } else {
          snake.add(snake.last + axisX);
        }
        break;
      case Direction.Up:
        if (snake.last < axisX) {
          snake.add(snake.last + axisY);
        } else {
          snake.add(snake.last - axisX);
        }
        break;
      case Direction.Right:
        if (snake.last % axisX == 0) {
          snake.add(snake.last - axisX);
        } else {
          snake.add(snake.last - 1);
        }
        break;
      case Direction.Left:
        if ((snake.last + 1) % axisX == 0) {
          snake.add(snake.last + axisX);
        } else {
          snake.add(snake.last + 1);
        }
        break;
      default:
    }

    snake.removeAt(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (direction != Direction.Up && details.delta.dy > 0) {
          direction = Direction.Down;
        } else if (direction != Direction.Down && details.delta.dy < 0) {
          direction = Direction.Up;
        }
      },
      onHorizontalDragUpdate: (details) {
        if (direction != Direction.Right && details.delta.dx > 0) {
          direction = Direction.Left;
        } else if (direction != Direction.Left && details.delta.dx < 0) {
          direction = Direction.Right;
        }
      },
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: axisY,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: axisX,
        ),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(2),
          color: snake.contains(index) ? Colors.green : Colors.grey[200],
        ),
      ),
    );
  }
}