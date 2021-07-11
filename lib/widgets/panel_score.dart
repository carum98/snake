import 'package:flutter/material.dart';
import 'package:snake/inherited/score_inherited.dart';
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

    ScoreInherited.of(context).score.addListener(() {
      print('Score increase');
      score = ScoreInherited.of(context).score.score;

      setState(() {});
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
            'Score: ${_buildScore(score)} / 100',
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
