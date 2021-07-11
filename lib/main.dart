import 'package:flutter/material.dart';
import 'package:snake/config/router.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/models/score.dart';
import 'package:snake/widgets/panel_score.dart';

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
  final Levels level;
  const SnakePage({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${level.string}'),
        centerTitle: true,
      ),
      body: ScoreInheritedWidget(
        score: Score(),
        child: Column(
          children: [
            PanelScore(),
            Expanded(
              child: SnakeGame(
                width: level.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
