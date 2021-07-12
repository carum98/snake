import 'package:flutter/material.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/models/score.dart';

class ScoreInherited extends InheritedWidget {
  ScoreInherited({
    Key? key,
    required Widget child,
    required this.score,
    required this.levels,
  }) : super(key: key, child: child);

  final Score score;
  final Levels levels;

  static ScoreInherited of(BuildContext context) {
    final ScoreInherited? result = context.dependOnInheritedWidgetOfExactType<ScoreInherited>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
