import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/level/1');
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade300,
                      blurRadius: 4,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/levels');
              },
              child: const Text('SELECT LEVEL'),
            ),
          ],
        ),
      ),
    );
  }
}
