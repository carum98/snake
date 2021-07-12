import 'package:flutter/material.dart';
import 'package:snake/constants/levels.dart';
import 'package:snake/inherited/score_inherited.dart';
import 'package:snake/widgets/next_level.dart';

class PanelScore extends StatefulWidget {
  const PanelScore({Key? key}) : super(key: key);

  @override
  _PanelScoreState createState() => _PanelScoreState();
}

class _PanelScoreState extends State<PanelScore> {
  int score = 0;
  late Levels level;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    level = ScoreInherited.of(context).levels;

    ScoreInherited.of(context).score.addListener(() {
      score = ScoreInherited.of(context).score.score;

      if (ScoreInherited.of(context).score.isComplete(level.meta)) {
        showDialog(
          context: context,
          builder: (_) => NextLevelDialog(
            level: ScoreInherited.of(context).levels.string,
          ),
        );
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Score: ${_buildScore(score)} / ${_buildScore(level.meta)}',
            style: const TextStyle(
              fontFamily: 'Digital-7',
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  String _buildScore(int score) {
    return score >= 10 ? '$score' : '0$score';
  }
}
