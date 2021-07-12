import 'package:flutter/material.dart';

class NextLevelDialog extends StatelessWidget {
  final String level;
  const NextLevelDialog({Key? key, required this.level}) : super(key: key);

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
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            const Text(
              'Success',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Next level'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/level/${int.parse(level) + 1}');
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
