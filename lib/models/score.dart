import 'package:flutter/material.dart';

class Score extends ChangeNotifier {
  int score = 0;

  void increseScore() {
    score++;
    notifyListeners();
  }

  bool isComplete(int meta) {
    return score >= meta;
  }
}
