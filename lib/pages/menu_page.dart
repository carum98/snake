import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Button(
              icon: Icons.play_arrow,
              onTap: () {
                Navigator.pushNamed(context, '/level/1');
              },
            ),
            SizedBox(
              height: 20,
            ),
            _Button(
              icon: Icons.list_outlined,
              onTap: () {
                Navigator.pushNamed(context, '/levels');
              },
            ),
            SizedBox(
              height: 20,
            ),
            _Button(
              icon: Icons.settings_outlined,
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const _Button({Key? key, required this.onTap, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            icon,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
