import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/level/1');
              },
              child: const Text('Play'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/levels');
              },
              child: const Text('Select level'),
            ),
          ],
        ),
      ),
    );
  }
}
