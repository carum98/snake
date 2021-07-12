import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snake/constants/direction.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/inherited/score_inherited.dart';
import 'package:snake/inherited/setting_inherited.dart';
import 'package:snake/models/setting.dart';
import 'package:snake/models/snake.dart';
import 'package:snake/widgets/game_over.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final Random random = Random();

  late Snake snake;
  List<int> obstables = [];

  Direction direction = Direction.Down;
  int axisX = 1, axisY = 1, food = 1;

  late Timer timer;
  late Setting setting;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final level = ScoreInherited.of(context).levels;

      axisX = context.size!.width ~/ level.width;
      axisY = ((context.size!.height - kToolbarHeight) ~/ level.width) * axisX;

      food = random.nextInt(axisY);

      setting = SettingsInherited.of(context).setting;

      if (setting.obstacules) {
        obstables = List.generate(5, (index) => random.nextInt(axisY));
      }

      snake = Snake(
        axisX: axisX,
        axisY: axisY,
        setting: setting,
        obstacles: obstables,
        onEat: () {
          food = random.nextInt(axisY);
          ScoreInherited.of(context).score.increseScore();
        },
        onDie: () {
          timer.cancel();
          showDialog(
            context: context,
            builder: (_) => GameOverDialog(),
          );
        },
      );

      timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
        snake.move(direction, food);
        if (ScoreInherited.of(context).score.isComplete(level.meta)) {
          timer.cancel();
        } else {
          setState(() {});
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
          color: snake.body.contains(index)
              ? Colors.green[400]
              : (food == index)
                  ? Colors.red
                  : (obstables.contains(index))
                      ? Colors.black54
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
}
