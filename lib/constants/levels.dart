enum Levels {
  One,
  Two,
  Three,
  Four,
  Five,
}

extension IntLevels on Levels {
  int get width {
    switch (this) {
      case Levels.One:
        return 20;
      case Levels.Two:
        return 30;
      case Levels.Three:
        return 40;
      case Levels.Four:
        return 50;
      case Levels.Five:
        return 60;
      default:
        throw Exception('No level');
    }
  }

  int get meta {
    switch (this) {
      case Levels.One:
        return 100;
      case Levels.Two:
        return 70;
      case Levels.Three:
        return 50;
      case Levels.Four:
        return 20;
      case Levels.Five:
        return 10;
      default:
        throw Exception('No level');
    }
  }

  String get string {
    switch (this) {
      case Levels.One:
        return '1';
      case Levels.Two:
        return '2';
      case Levels.Three:
        return '3';
      case Levels.Four:
        return '4';
      case Levels.Five:
        return '5';
      default:
        throw Exception('No level');
    }
  }
}
