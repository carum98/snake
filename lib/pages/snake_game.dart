import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/constants/direction.dart';
import 'package:snake/widgets/panel_score.dart';

class SnakeGame extends StatefulWidget {
  final int width;
  const SnakeGame({Key? key, required this.width}) : super(key: key);

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final Random random = Random();

  List<int> snake = [35, 55, 75, 95];
  Direction direction = Direction.Down;
  int axisX = 1, axisY = 1, food = 1;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      axisX = context.size!.width ~/ widget.width;
      axisY = ((context.size!.height - kToolbarHeight) ~/ widget.width) * axisX;

      food = random.nextInt(axisY);

      timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
        update();

        if (snake.length > snake.toSet().length) {
          gameOver();
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
      case Direction.Left:
        if (snake.last % axisX == 0) {
          snake.add(snake.last - 1 + axisX);
        } else {
          snake.add(snake.last - 1);
        }
        break;
      case Direction.Right:
        if ((snake.last + 1) % axisX == 0) {
          snake.add(snake.last + 1 - axisX);
        } else {
          snake.add(snake.last + 1);
        }
        break;
      default:
    }

    if (snake.last == food) {
      food = random.nextInt(axisY);
      ScoreInheritedWidget.of(context).score.increseScore();
    } else {
      snake.removeAt(0);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (axisY <= 1) return Center(child: CircularProgressIndicator());

    return (kIsWeb || Platform.isMacOS)
        ? RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                _keyboardControl(event.physicalKey);
              }
            },
            child: _buildGrid(),
          )
        : GestureDetector(
            onVerticalDragUpdate: (details) {
              _gestureControl(details, 'vertical');
            },
            onHorizontalDragUpdate: (details) {
              _gestureControl(details, 'horizontal');
            },
            child: _buildGrid(),
          );
  }

  GridView _buildGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: axisY,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisX,
      ),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: snake.contains(index)
              ? Colors.green[400]
              : (food == index)
                  ? Colors.red
                  : Colors.grey[200],
        ),
      ),
    );
  }

  void _keyboardControl(PhysicalKeyboardKey key) {
    if (key == PhysicalKeyboardKey.arrowDown) {
      direction = Direction.Down;
    } else if (key == PhysicalKeyboardKey.arrowUp) {
      direction = Direction.Up;
    } else if (key == PhysicalKeyboardKey.arrowLeft) {
      direction = Direction.Left;
    } else if (key == PhysicalKeyboardKey.arrowRight) {
      direction = Direction.Right;
    }
  }

  void _gestureControl(DragUpdateDetails details, String axis) {
    if (axis == 'vertical') {
      if (direction != Direction.Up && details.delta.dy > 0) {
        direction = Direction.Down;
      } else if (direction != Direction.Down && details.delta.dy < 0) {
        direction = Direction.Up;
      }
    } else if (axis == 'horizontal') {
      if (direction != Direction.Right && details.delta.dx < 0) {
        direction = Direction.Left;
      } else if (direction != Direction.Left && details.delta.dx > 0) {
        direction = Direction.Right;
      }
    }
  }

  void gameOver() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Icon(
                Icons.highlight_off_outlined,
                color: Colors.red,
                size: 60,
              ),
              Text(
                'Game Over',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Exit'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
