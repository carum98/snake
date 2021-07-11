import 'package:flutter/material.dart';

class SelectLevelPage extends StatelessWidget {
  const SelectLevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select level'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/level/${index + 1}');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
