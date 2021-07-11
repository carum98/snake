import 'package:flutter/material.dart';
import 'package:snake/models/score.dart';

class PanelScore extends StatefulWidget {
  const PanelScore({Key? key}) : super(key: key);

  @override
  _PanelScoreState createState() => _PanelScoreState();
}

class _PanelScoreState extends State<PanelScore> {
  int score = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ScoreInheritedWidget.of(context).score.addListener(() {
      print('Score increase');
      score = ScoreInheritedWidget.of(context).score.score;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Score $score');
  }
}

class ScoreInheritedWidget extends InheritedWidget {
  ScoreInheritedWidget({
    Key? key,
    required Widget child,
    required this.score,
  }) : super(key: key, child: child);

  final Score score;

  static ScoreInheritedWidget of(BuildContext context) {
    final ScoreInheritedWidget? result =
        context.dependOnInheritedWidgetOfExactType<ScoreInheritedWidget>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
