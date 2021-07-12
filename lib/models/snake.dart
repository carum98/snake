import 'package:snake/constants/direction.dart';
import 'package:snake/models/setting.dart';

class Snake {
  final int axisX;
  final int axisY;
  final List<int> obstacles;

  final Setting setting;

  final Function onEat;
  final Function onDie;

  List<int> body = [1];

  Snake({
    required this.axisX,
    required this.axisY,
    required this.obstacles,
    required this.setting,
    required this.onEat,
    required this.onDie,
  });

  void move(Direction direction, int food) {
    switch (direction) {
      case Direction.Up:
        _up();
        break;
      case Direction.Down:
        _down();
        break;
      case Direction.Left:
        _left();
        break;
      case Direction.Right:
        _right();
        break;
    }

    if (body.length > body.toSet().length) {
      onDie();
    }

    if (obstacles.any((e) => body.contains(e))) {
      onDie();
    }

    if (body.last == food) {
      onEat();
    } else {
      body.removeAt(0);
    }
  }

  void _up() {
    if (body.last < axisX) {
      (setting.border) ? onDie() : body.add(body.last + axisY);
    } else {
      body.add(body.last - axisX);
    }
  }

  void _down() {
    if (body.last > axisY) {
      (setting.border) ? onDie() : body.add(body.last - axisY);
    } else {
      body.add(body.last + axisX);
    }
  }

  void _left() {
    if (body.last % axisX == 0) {
      (setting.border) ? onDie() : body.add(body.last - 1 + axisX);
    } else {
      body.add(body.last - 1);
    }
  }

  void _right() {
    if ((body.last + 1) % axisX == 0) {
      (setting.border) ? onDie() : body.add(body.last + 1 - axisX);
    } else {
      body.add(body.last + 1);
    }
  }
}
