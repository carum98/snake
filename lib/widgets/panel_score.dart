import 'package:flutter/material.dart';

class PanelScore extends StatefulWidget {
  const PanelScore({Key? key}) : super(key: key);

  @override
  _PanelScoreState createState() => _PanelScoreState();
}

class _PanelScoreState extends State<PanelScore> {
  @override
  Widget build(BuildContext context) {
    return Text('Score');
  }
}
