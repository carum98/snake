import 'package:flutter/material.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/inherited/score_inherited.dart';
import 'package:snake/models/score.dart';
import 'package:snake/widgets/snake_game.dart';
import 'package:snake/widgets/panel_score.dart';

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
      body: ScoreInherited(
        score: Score(),
        levels: level,
        child: Column(
          children: [
            PanelScore(),
            Expanded(
              child: SnakeGame(),
            ),
          ],
        ),
      ),
    );
  }
}
