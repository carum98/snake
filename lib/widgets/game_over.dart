import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Icon(
              Icons.highlight_off_outlined,
              color: Colors.red,
              size: 60,
            ),
            Text(
              'Game Over',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
